Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33891 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdH3OQ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 10:16:56 -0400
Subject: Re: [PATCH 3/3] tests: Add BRS test
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
 <20170824093043.8606-4-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <076d3ab9-9a02-2504-bcc8-dbf20324b7c9@ideasonboard.com>
Date: Wed, 30 Aug 2017 15:16:52 +0100
MIME-Version: 1.0
In-Reply-To: <20170824093043.8606-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 24/08/17 10:30, Laurent Pinchart wrote:
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Nothing scary in here. Just pending testing the other patchset/issues, then I
can run this through as well for a tested-by.

Meanwhile:

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


> ---
>  tests/vsp-unit-test-0024.sh | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100755 tests/vsp-unit-test-0024.sh
> 
> diff --git a/tests/vsp-unit-test-0024.sh b/tests/vsp-unit-test-0024.sh
> new file mode 100755
> index 000000000000..036429254a8f
> --- /dev/null
> +++ b/tests/vsp-unit-test-0024.sh
> @@ -0,0 +1,45 @@
> +#!/bin/sh
> +
> +#
> +# Test composition through the BRS in RGB and YUV formats.
> +#
> +
> +source vsp-lib.sh
> +
> +features="rpf.0 rpf.1 brs wpf.0"
> +formats="RGB24 YUV444M"
> +
> +test_brs() {
> +	local format=$1
> +	local ninputs=$2
> +
> +	test_start "BRS in $format with $ninputs inputs"
> +
> +	pipe_configure rpf-brs $ninputs
> +	format_configure rpf-brs $format 1024x768 $ninputs
> +
> +	local input
> +	for input in `seq 0 1 $((ninputs-1))` ; do
> +		vsp_runner rpf.$input &
> +	done
> +	vsp_runner wpf.0
> +
> +	local result=$(compare_frames)
> +
> +	test_complete $result
> +}
> +
> +test_main() {
> +	local num_inputs=2
> +	local format
> +	local ninputs
> +
> +	for format in $formats ; do
> +		for ninputs in `seq $num_inputs` ; do
> +			test_brs $format $ninputs
> +		done
> +	done
> +}
> +
> +test_init $0 "$features"
> +test_run
> 
