Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 4/5] vsp-lib: Support RPF frame cropping
Date: Fri, 10 Feb 2017 11:20:20 +0200
Message-ID: <31635178.gz5IoCATKn@avalon>
In-Reply-To: <a5a3445637837e9bca24ccc6585e40f52acbe069.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com> <a5a3445637837e9bca24ccc6585e40f52acbe069.1486562055.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Wednesday 08 Feb 2017 14:03:59 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Pass the optional '--crop (X,Y)/WxH' parameter through reference_frame
> allowing the input to be cropped for comparison
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  scripts/vsp-lib.sh | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 08bf8f36c582..42a4bb20d1be 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -162,6 +162,9 @@ reference_frame() {
>  		vflip)
>  			[ x$value = x1 ] && options="$options --vflip"
>  			;;
> +		crop)
> +			options="$options --crop $value"
> +			;;

Could you please keep the options sorted alphabetically ?

>  		esac
>  	done
> 
> @@ -717,6 +720,40 @@ format_rpf_wpf() {
>  	__vsp_wpf_format=$5
>  }
> 
> +format_crop_rpf_wpf() {
> +	local rpf=$1
> +	local wpf=$2
> +	local infmt=$(format_v4l2_to_mbus $3)
> +	local size=$4
> +	local outfmt=$(format_v4l2_to_mbus $5)
> +	local rpfcrop=$6
> +	local wpfcrop=$7
> +	local rpfoutsize=
> +	local outsize=
> +
> +	if [ x$rpfcrop != 'x' ] ; then

I don't think this will work properly. You want to test for the presence of an 
RPF crop argument. If it's absent, and the WPF crop argument is specified, WPF 
crop will be stored in $6, and will thus be assigned to $rpfcrop.

I see two possible solutions. One of them is to make the RPF crop argument 
mandatory. After all, given the function name, one can expect RPF crop to be 
specified, otherwise the caller should use rpf-wpf, not crop-rpf-wpf. Another 
more versatile option would be to add RPF crop support to the existing 
format_rpf_wpf() crop function, and make both RPF and WPF crop optional. You 
could use named option for that (rcrop=... wcrop=...) or use a special value 
to indicate that an option should be skipped (for instance "- (0,0)/640x480" 
to set the WPF crop rectangle without setting the RPF crop rectangle).

> +		rpfcrop="crop:$rpfcrop"
> +		rpfoutsize=$(echo $rpfcrop | sed 's/.*\///')
> +	else
> +		rpfoutsize=$size
> +	fi
> +
> +	if [ x$wpfcrop != 'x' ] ; then
> +		wpfcrop="crop:$wpfcrop"
> +		outsize=$(echo $wpfcrop | sed 's/.*\///')
> +	else
> +		outsize=$rpfoutsize
> +	fi
> +
> +	$mediactl -d $mdev -V "'$dev rpf.$rpf':0 [fmt:$infmt/$size $rpfcrop]"
> +	$mediactl -d $mdev -V "'$dev rpf.$rpf':1 [fmt:$infmt/$rpfoutsize]"
> +	$mediactl -d $mdev -V "'$dev wpf.$wpf':0 [fmt:$infmt/$rpfoutsize
> $wpfcrop]"
> +	$mediactl -d $mdev -V "'$dev wpf.$wpf':1 [fmt:$outfmt/$outsize]"
> +
> +	__vsp_rpf_format=$3
> +	__vsp_wpf_format=$5
> +}
> +
>  format_wpf() {
>  	local format=$(format_v4l2_to_mbus $1)
>  	local size=$2

-- 
Regards,

Laurent Pinchart
