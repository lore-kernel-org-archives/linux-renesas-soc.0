Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCHv2 3/5] logger: Log to the FTrace buffer if tracing is enabled
Date: Mon, 13 Feb 2017 16:21:37 +0200
Message-ID: <4577996.faKKJcSsZt@avalon>
In-Reply-To: <1480627909-19207-4-git-send-email-kieran.bingham+renesas@ideasonboard.com>
References: <1480627909-19207-1-git-send-email-kieran.bingham+renesas@ideasonboard.com> <1480627909-19207-4-git-send-email-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Thursday 01 Dec 2016 21:31:47 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Extend the logger such that it will detect the tracing system, and also
> append print statement to this ring buffer.
> 
> This provides the relevant logging output interspersed in the ftrace
> logs for an effective solution to identifying the actions that caused
> the traces to occur
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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
> +	done;
>  done

-- 
Regards,

Laurent Pinchart
