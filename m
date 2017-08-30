Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33872 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751792AbdH3OKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 10:10:18 -0400
Subject: Re: [PATCH 2/3] vsp-lib: Add support for RPF-BRS-WPF pipelines
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
 <20170824093043.8606-3-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <5b8e2b63-1e47-e919-c8d9-534e018c5825@ideasonboard.com>
Date: Wed, 30 Aug 2017 15:10:13 +0100
MIME-Version: 1.0
In-Reply-To: <20170824093043.8606-3-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

Thankyou for the patch

On 24/08/17 10:30, Laurent Pinchart wrote:
> Reuse the BRU code, using the brx generic name to cover both BRU and
> BRS.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

This looks good to me:
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  scripts/vsp-lib.sh | 63 +++++++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index fa4a6984e1bb..0f3992a7827e 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -53,11 +53,16 @@ vsp1_count_wpfs() {
>  	$mediactl -d $mdev -p | grep -- '- entity.*wpf.[0-9] [^o]' | wc -l
>  }
>  
> -vsp1_count_bru_inputs() {
> -	local num_pads=`$mediactl -d $mdev -p | grep 'entity.*bru' | sed 's/.*(\([0-9]\) pads.*/\1/'`
> +__vsp1_count_brx_inputs() {
> +	local name=$1
> +	local num_pads=`$mediactl -d $mdev -p | grep "entity.*$name" | sed 's/.*(\([0-9]\) pads.*/\1/'`
>  	echo $((num_pads-1))
>  }
>  
> +vsp1_count_bru_inputs() {
> +	__vsp1_count_brx_inputs "bru"
> +}
> +
>  vsp1_entity_subdev() {
>  	$mediactl -d $mdev -e "$dev $1"
>  }
> @@ -105,7 +110,7 @@ reference_frame() {
>  
>  	# gen-image doesn't support processing HSV input images. The good news
>  	# is that the HSV tests that take HSV images as inputs don't need to
> -	# perform any processing. We can set the input format to RGB for HSV
> +	# perform any processing. We can set the input format to RGB for HSB
>  	# reference frame generation.
>  	case $in_format in
>  	HSV24 | HSV32)
> @@ -178,7 +183,7 @@ reference_frame() {
>  		esac
>  	done
>  
> -	[ x$__vsp_bru_inputs != x ] && options="$options -c $__vsp_bru_inputs"
> +	[ x$__vsp_brx_inputs != x ] && options="$options -c $__vsp_brx_inputs"
>  
>  	$genimage -i $in_format -f $out_format -s $size -a $alpha $options -o $file \
>  		frames/frame-reference-1024x768.pnm
> @@ -363,18 +368,27 @@ pipe_none() {
>  	return
>  }
>  
> -pipe_rpf_bru() {
> -	local ninputs=$1
> +__pipe_rpf_brx() {
> +	local name=$1
> +	local ninputs=$2
>  
> -	local bru_output=$(vsp1_count_bru_inputs)
> +	local output=$(__vsp1_count_brx_inputs $name)
>  
>  	for input in `seq 0 1 $((ninputs-1))` ; do
> -		$mediactl -d $mdev -l "'$dev rpf.$input':1 -> '$dev bru':$input [1]"
> +		$mediactl -d $mdev -l "'$dev rpf.$input':1 -> '$dev $name':$input [1]"
>  	done
> -	$mediactl -d $mdev -l "'$dev bru':$bru_output -> '$dev wpf.0':0 [1]"
> +	$mediactl -d $mdev -l "'$dev $name':$output -> '$dev wpf.0':0 [1]"
>  	$mediactl -d $mdev -l "'$dev wpf.0':1 -> '$dev wpf.0 output':0 [1]"
>  
> -	__vsp_bru_inputs=$ninputs
> +	__vsp_brx_inputs=$ninputs
> +}
> +
> +pipe_rpf_brs() {
> +	__pipe_rpf_brx "brs" $*
> +}
> +
> +pipe_rpf_bru() {
> +	__pipe_rpf_brx "bru" $*
>  }
>  
>  pipe_rpf_bru_uds() {
> @@ -468,7 +482,7 @@ pipe_rpf_wpf() {
>  pipe_reset() {
>  	$mediactl -d $mdev -r
>  
> -	__vsp_bru_inputs=
> +	__vsp_brx_inputs=
>  	__vsp_histo_type=
>  	__vsp_rpf_format=
>  	__vsp_wpf_index=0
> @@ -532,26 +546,35 @@ format_rpf() {
>  	__vsp_rpf_format=$1
>  }
>  
> -format_rpf_bru() {
> -	local format=$(format_v4l2_to_mbus $1)
> -	local size=$2
> -	local ninputs=$3
> +__format_rpf_brx() {
> +	local name=$1
> +	local format=$(format_v4l2_to_mbus $2)
> +	local size=$3
> +	local ninputs=$4
>  	local offset=0
>  
> -	local bru_output=$(vsp1_count_bru_inputs)
> +	local output=$(__vsp1_count_brx_inputs $name)
>  
>  	for input in `seq 0 1 $((ninputs-1))` ; do
>  		offset=$((offset+50))
>  		$mediactl -d $mdev -V "'$dev rpf.$input':0 [fmt:$format/$size]"
> -		$mediactl -d $mdev -V "'$dev bru':$input   [fmt:$format/$size compose:($offset,$offset)/$size]"
> +		$mediactl -d $mdev -V "'$dev $name':$input [fmt:$format/$size compose:($offset,$offset)/$size]"
>  	done
>  
> -	$mediactl -d $mdev -V "'$dev bru':$bru_output [fmt:$format/$size]"
> +	$mediactl -d $mdev -V "'$dev $name':$output [fmt:$format/$size]"
>  	$mediactl -d $mdev -V "'$dev wpf.0':0 [fmt:$format/$size]"
>  	$mediactl -d $mdev -V "'$dev wpf.0':1 [fmt:$format/$size]"
>  
> -	__vsp_rpf_format=$1
> -	__vsp_wpf_format=$1
> +	__vsp_rpf_format=$2
> +	__vsp_wpf_format=$2
> +}
> +
> +format_rpf_brs() {
> +	__format_rpf_brx "brs" $*
> +}
> +
> +format_rpf_bru() {
> +	__format_rpf_brx "bru" $*
>  }
>  
>  format_rpf_bru_uds() {
> 
