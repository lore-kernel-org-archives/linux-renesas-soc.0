Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kbingham@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, Kieran Bingham <kieran@bingham.xyz>
Subject: Re: [PATCH 3/5] logger: Log to the FTrace buffer if tracing is enabled
Date: Fri, 25 Nov 2016 19:40:32 +0200
Message-ID: <2017783.bbo1Ya7scD@avalon>
In-Reply-To: <1480082356-23380-4-git-send-email-kbingham@kernel.org>
References: <1480082356-23380-1-git-send-email-kbingham@kernel.org> <1480082356-23380-4-git-send-email-kbingham@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Friday 25 Nov 2016 13:59:14 Kieran Bingham wrote:
> From: Kieran Bingham <kieran@bingham.xyz>
> 
> Extend the logger such that it will detect the tracing system, and also
> append print statement to this ring buffer.
> 
> This provides the relevant logging output interspersed in the ftrace
> logs for an effective solution to identifying the actions that caused
> the traces to occur
> 
> Signed-off-by: Kieran Bingham <kieran@bingham.xyz>
> ---
>  scripts/logger.sh | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/logger.sh b/scripts/logger.sh
> index 8123f0c9f6e3..8412b0ba9a08 100755
> --- a/scripts/logger.sh
> +++ b/scripts/logger.sh
> @@ -6,6 +6,17 @@ now() {
> 
>  label=${1:+ [$1]}
> 
> +TRACE_MARKER=/sys/kernel/debug/tracing/trace_marker
> +if [ -e $TRACE_MARKER ]; then
> +	extra_log_files=$TRACE_MARKER
> +fi
> +
>  while read line ; do
> -	echo "$(now)$label $line"
> +	newline="$(now)$label $line"
> +
> +	echo "$newline"
> +
> +	for f in $extra_log_files; do
> +		echo "$newline" >> $f;

As the tracer adds a timestamp, should you echo "$label $line" only here ?

> +	done;
>  done

-- 
Regards,

Laurent Pinchart
