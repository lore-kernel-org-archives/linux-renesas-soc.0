Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] drm: Add LVDS decoder bridge
To: Jacopo Mondi <jacopo+renesas@jmondi.org>, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        robh+dt@kernel.org, mark.rutland@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <b0eec899-424f-f71d-8c1f-9ff8f0211f7f@codeaurora.org>
Date: Sat, 10 Mar 2018 11:23:19 +0530
MIME-Version: 1.0
In-Reply-To: <1520603500-15218-1-git-send-email-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On Friday 09 March 2018 07:21 PM, Jacopo Mondi wrote:
> Hello,
>     after some discussion on the proposed bindings for generic lvds decoder and
> Thine THC63LVD1024, I decided to drop the THC63 specific part and just live with
> a transparent decoder that does not support any configuration from DT.
> 
> Dropping THC63 support to avoid discussion on how to better implement support
> for a DRM bridge with 2 input ports and focus on LVDS mode propagation through
> bridges as explained in v1 cover letter (for DRM people: please see [1] as why
> I find difficult to implement support for bridges with multiple input endpoints)
> 
> Same base branch as v1, with same patches for V3M Eagle applied on top.
> git://jmondi.org/linux v3m/v4.16-rc3/base
> 
> Thanks
>     j
> 
> v1 -> v2:
> - Drop support for THC63LVD1024
> 
> [1] I had a quick at how to model a DRM bridge with multiple input
> ports, and I see a blocker in how DRM identifies and matches bridges using
> the devices node in place of the endpoint nodes.
> 
> As THC63LVD1024 supports up to 2 LVDS inputs and 2 LVDS outputs, I see only
> a few ways to support that:
>   1) register 2 drm bridges from the same driver (one for each input/output pair)
>      but they would both be matches on the same device node when the preceding
>      bridge calls "of_drm_find_bridge()".

I think this is the way to go. DRM doesn't say anywhere that we can't 
have 2 drm_bridge-s contained in a single device. About the issue with
of_drm_find_bridge(), if you set the 2 bridge's 'of_node' field to
the bridge1 and bridge2 nodes as shown below, wouldn't that suffice. 
 From what I know, we don't necessarily need to set the bridge's of_node
to the device (i.e, thschip) itself.

thschip {
	...
	ports {
		bridge1: port@0 {
			...
		};

		bridge2: port@1 {
			...
		};
	};
};


Thanks,
Archit

>   2) register a single bridge with multiple "next bridges", but when the bridge
>      gets attached I don't see a way on how to identify on which next bridge
>      "drm_bridge_attach()" on, as it depends on the endpoint the current bridge
>      has been attached on first, and we don't have that information.
>   3) Register more instances of the same chip in DTS, one for each input/output
>      pair. They gonna share supplies and gpios, and I don't like that.
> 
> I had a quick look at the currently in mainline bridges and none of them has
> multiple input endpoints, except for HDMI audio endpoint, which I haven't found
> in use in any DTS. I guess the problem has been already debated and maybe solved
> in the past, so feel free to point me to other sources.
> 
> Jacopo Mondi (3):
>    dt-bindings: display: bridge: Document LVDS to parallel decoder
>    drm: bridge: Add LVDS decoder driver
>    arm64: dts: renesas: Add LVDS decoder to R-Car V3M Eagle
> 
>   .../bindings/display/bridge/lvds-decoder.txt       |  42 ++++++
>   arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  31 +++-
>   drivers/gpu/drm/bridge/Kconfig                     |   8 ++
>   drivers/gpu/drm/bridge/Makefile                    |   1 +
>   drivers/gpu/drm/bridge/lvds-decoder.c              | 157 +++++++++++++++++++++
>   5 files changed, 237 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-decoder.txt
>   create mode 100644 drivers/gpu/drm/bridge/lvds-decoder.c
> 
> --
> 2.7.4
> 
