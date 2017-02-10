Return-Path: <kieran+caf_=kieranbingham=gmail.com@ksquared.org.uk>
Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 5/5] tests: Add RPF cropping test
Date: Fri, 10 Feb 2017 11:22:55 +0200
Message-ID: <4312201.BVK58u2f9U@avalon>
In-Reply-To: <b824c441b822b7453b5b10773a85ae562c2fd6bc.1486562055.git-series.kieran.bingham@ideasonboard.com>
References: <cover.381fcf0d4db5fa66965cf3d2fca214970f22122b.1486562055.git-series.kieran.bingham@ideasonboard.com> <b824c441b822b7453b5b10773a85ae562c2fd6bc.1486562055.git-series.kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

Thank you for the patch.

On Wednesday 08 Feb 2017 14:04:00 Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Test both the input cropping size and position
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  tests/vsp-unit-test-0021.sh | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0021.sh
> 
> diff --git a/tests/vsp-unit-test-0021.sh b/tests/vsp-unit-test-0021.sh
> new file mode 100755
> index 000000000000..d00dd0dece97
> --- /dev/null
> +++ b/tests/vsp-unit-test-0021.sh
> @@ -0,0 +1,39 @@
> +#!/bin/sh
> +
> +#
> +# Test RPF crop in RGB and YUV mode. Use a RPF -> WPF pipeline with a fixed
> ARGB32
> +# format on the input and capture output frames in all RGB formats
> supported
> +# by the WPF.
> +#
> +
> +source vsp-lib.sh
> +
> +features="rpf.0 wpf.0"
> +crops="(0,0)/512x384 (32,32)/512x384 (32,64)/512x384 (64,32)/512x384"
> +
> +

A single blank line should do.

> +test_rpf_cropping() {
> +	test_start "RPF crop from $crop"
> +
> +	pipe_configure rpf-wpf 0 0
> +	format_configure crop-rpf-wpf 0 0 RGB24 1024x768 ARGB32 $crop
> +
> +	vsp_runner rpf.0 &
> +	vsp_runner wpf.0
> +
> +	local result=$(compare_frames crop=${crop})
> +
> +	test_complete $result
> +}
> +
> +test_main() {
> +	local format

You don't use this variable.

With this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	local crop
> +
> +	for crop in $crops ; do
> +		test_rpf_cropping $crop
> +	done
> +}
> +
> +test_init $0 "$features"
> +test_run

-- 
Regards,

Laurent Pinchart
