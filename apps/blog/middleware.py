from blog.models import IPLogs


class IpLogMiddleware(object):
    def __init__(self, get_response):
        # 程序启动时执行, 只执行一次
        self.get_response = get_response

    def __call__(self, request):
        # 中间件开始
        response = self.get_response(request)
        # 中间件结束
        return response

    def process_view(self, request, view_func, view_args, view_kwargs):
        if 'HTTP_X_FORWARDED_FOR' in request.META:
            ip = request.META['HTTP_X_FORWARDED_FOR']
        else:
            ip = request.META['REMOTE_ADDR']
        try:
            ip_instant = IPLogs.objects.get(ip=ip)
            ip_instant.visit_times += 1
            ip_instant.save()
        except IPLogs.DoesNotExist:
            IPLogs.objects.create(ip=ip)

    def process_exception(self, request, exception):
        # 程序异常时执行
        return None
