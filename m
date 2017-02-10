Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/5] vsp-lib: Filter non-filesystem regular characters
Date: Fri, 10 Feb 2017 09:58:15 +0200
Message-ID: <4109815.N8jzog9Deg@avalon>
In-Reply-To: <9205d7a3e6fa64aa86ddc99d88b84008213015e7.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com> <9205d7a3e6fa64aa86ddc99d88b84008213015e7.1486562055.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Wednesday 08 Feb 2017 14:03:57 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Parameters can contain characters not suited to use in filenames.
> 
> Add '=','(', and ')' to the filtering, and replace with '_'

What's the issue with those characters ? :-)

> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 5aff30217a27..08bf8f36c582 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -263,6 +263,9 @@ compare_frames() {
>  	local params=${args// /-}
>  	params=${params:+-$params}
>  	params=${params//\//_}
> +	params=${params/=/_}
> +	params=${params/(/_}
> +	params=${params/)/_}

According to the bash manpage,

"If pattern begins with /, all matches of pattern are replaced with string.  
Normally only the first match is replaced."

Shouldn't you add a leading / as for the \/ substitution ?

>  	params=$in_fmt-$out_fmt-$size$params
> 
>  	if [ x$__vsp_pixel_perfect != xtrue ] ; then

-- 
Regards,

Laurent Pinchart
