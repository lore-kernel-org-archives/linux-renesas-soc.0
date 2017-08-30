Subject: Re: [PATCH 0/3] vsp-tests: Add BRS test
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
Reply-To: kieran.bingham@ideasonboard.com
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Message-ID: <95423ae3-33c3-ceff-59c5-95c1c13e62b8@ideasonboard.com>
Date: Wed, 30 Aug 2017 16:09:37 +0100
MIME-Version: 1.0
In-Reply-To: <20170824093043.8606-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

For the series,

On Salvator-XS (with minor kernel change to enable .uapi on VSPD entities)

root@Ubuntu-ARM64:~/vsp-tests# ./vsp-unit-test-0024.sh
Testing BRS in RGB24 with 1 inputs: pass
Testing BRS in RGB24 with 2 inputs: pass
Testing BRS in YUV444M with 1 inputs: pass
Testing BRS in YUV444M with 2 inputs: pass
root@Ubuntu-ARM64:~/vsp-tests#

Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

--
Regards

Kieran

Interestingly as a side note, while on the Salvator-XS, I ran test-0003 and it
went straight through 4 times consecutively!

root@Ubuntu-ARM64:~/vsp-tests# ./vsp-unit-test-0003.sh
Testing scaling from 640x640 to 640x480 in RGB24: pass
Testing scaling from 1024x768 to 640x480 in RGB24: pass
Testing scaling from 640x480 to 1024x768 in RGB24: pass
Testing scaling from 640x640 to 640x480 in YUV444M: pass
Testing scaling from 1024x768 to 640x480 in YUV444M: pass
Testing scaling from 640x480 to 1024x768 in YUV444M: pass



On 24/08/17 10:30, Laurent Pinchart wrote:
> Hello,
> 
> This patch series adds a test to the VSP unit test suite for the BRS module.
> 
> The BRS is the Blend/ROP Secondary unit, a stripped-down version of the BRU
> that supports two inputs only. It is present in some VSPD instances, in
> particular on the H3 ES2.0.
> 
> As the VSPD is used for display pipelines only the BRS can't be tested through
> the V4L2 API with the upstream VSP driver. A simple hack that exposes the VSPD
> through V4L2 is needed.
> 
> Laurent Pinchart (3):
>   vsp-lib: Use the correct media device name to count BRU inputs
>   vsp-lib: Add support for RPF-BRS-WPF pipelines
>   tests: Add BRS test
> 
>  scripts/vsp-lib.sh          | 63 +++++++++++++++++++++++++++++++--------------
>  tests/vsp-unit-test-0024.sh | 45 ++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+), 20 deletions(-)
>  create mode 100755 tests/vsp-unit-test-0024.sh
> 
