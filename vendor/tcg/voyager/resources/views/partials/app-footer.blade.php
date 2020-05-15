<footer class="app-footer">
    <div class="site-footer-right">
        @if (rand(1,100) == 100)
            <i class="voyager-rum-1"></i> {{ __('voyager::theme.footer_copyright2') }}
        @else
            <a href="http://levelupfoundation.in/exam_app" target="_blank">Study Portal</a>
        @endif
        @php $version = "1.0"; @endphp
        @if (!empty($version))
            - {{ $version }}
        @endif
    </div>
</footer>
