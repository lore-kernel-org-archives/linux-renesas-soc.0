Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:33953 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751566AbdH3Ojk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 10:39:40 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] tests: Add BRS test
Date: Wed, 30 Aug 2017 17:40:15 +0300
Message-ID: <1788528.qyv9N0TDJX@avalon>
In-Reply-To: <9037341f-767c-a472-3fc3-019f5436d39b@ideasonboard.com>
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com> <076d3ab9-9a02-2504-bcc8-dbf20324b7c9@ideasonboard.com> <9037341f-767c-a472-3fc3-019f5436d39b@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Wednesday, 30 August 2017 17:31:11 EEST Kieran Bingham wrote:
> Hi Laurent,
> 
> Clearly I hit send too early <pre-testing> :-D
> 
> On 30/08/17 15:16, Kieran Bingham wrote:
> > Hi Laurent,
> > 
> > On 24/08/17 10:30, Laurent Pinchart wrote:
> >> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > Nothing scary in here. Just pending testing the other patchset/issues,
> > then I can run this through as well for a tested-by.
> > 
> > Meanwhile:
> > 
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> >> ---
> >> 
> >>  tests/vsp-unit-test-0024.sh | 45
> >>  +++++++++++++++++++++++++++++++++++++++++++++ 1 file changed, 45
> >>  insertions(+)
> >>  create mode 100755 tests/vsp-unit-test-0024.sh
> >> 
> >> diff --git a/tests/vsp-unit-test-0024.sh b/tests/vsp-unit-test-0024.sh
> >> new file mode 100755
> >> index 000000000000..036429254a8f
> >> --- /dev/null
> >> +++ b/tests/vsp-unit-test-0024.sh
> >> @@ -0,0 +1,45 @@
> >> +#!/bin/sh
> >> +
> >> +#
> >> +# Test composition through the BRS in RGB and YUV formats.
> >> +#
> >> +
> >> +source vsp-lib.sh
> 
> Please can this be:
> . ./vsp-lib.sh

Sure, it's now fixed in my tree, I'm just waiting for your Tested-by: tag 
before pushing it out.

> >> +
> >> +features="rpf.0 rpf.1 brs wpf.0"
> >> +formats="RGB24 YUV444M"
> >> +
> >> +test_brs() {
> >> +	local format=$1
> >> +	local ninputs=$2
> >> +
> >> +	test_start "BRS in $format with $ninputs inputs"
> >> +
> >> +	pipe_configure rpf-brs $ninputs
> >> +	format_configure rpf-brs $format 1024x768 $ninputs
> >> +
> >> +	local input
> >> +	for input in `seq 0 1 $((ninputs-1))` ; do
> >> +		vsp_runner rpf.$input &
> >> +	done
> >> +	vsp_runner wpf.0
> >> +
> >> +	local result=$(compare_frames)
> >> +
> >> +	test_complete $result
> >> +}
> >> +
> >> +test_main() {
> >> +	local num_inputs=2
> >> +	local format
> >> +	local ninputs
> >> +
> >> +	for format in $formats ; do
> >> +		for ninputs in `seq $num_inputs` ; do
> >> +			test_brs $format $ninputs
> >> +		done
> >> +	done
> >> +}
> >> +
> >> +test_init $0 "$features"
> >> +test_run

-- 
Regards,

Laurent Pinchart
