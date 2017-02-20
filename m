Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] vsp-lib: Fix reference frame generation for HSV input
 formats
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
References: <20170213154656.30363-1-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1db398d2-8b72-1bb9-66fb-b6c47ba9c7a4@ideasonboard.com>
Date: Mon, 20 Feb 2017 10:46:15 +0000
MIME-Version: 1.0
In-Reply-To: <20170213154656.30363-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 13/02/17 15:46, Laurent Pinchart wrote:
> gen-image doesn't support processing HSV input frames. Fortunately the
> HSV tests don't require it either, when they take an HSV input frame
> they just pass it straight to the WPF. We can thus set the input format
> to RGB for reference frame generation.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index ae9683cffab6..695e081bf34d 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -103,6 +103,16 @@ reference_frame() {
>  	local alpha=
>  	local options=
>  
> +	# gen-image doesn't support processing HSV input images. The good news
> +	# is that the HSV tests that take HSV images as inputs don't need to
> +	# perform any processing. We can set the input format to RGB for HSB

s/HSB/HSV/

> +	# reference frame generation.
> +	case $in_format in
> +	HSV24 | HSV32)
> +		in_format=ARGB32
> +		;;
> +	esac
> +
>  	# Start with the input format to compute the alpha value being used by
>  	# the RPF after unpacking. Keep in sync with generate_input_frame.
>  	case $in_format in

With that,

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
