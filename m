Return-Path: <devicetree-owner@vger.kernel.org>
Message-ID: <1489788135.8957.2.camel@collabora.co.uk>
Subject: Re: [PATCH 0/4] arm64: renesas: enable M3ULCB board peripherals
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: Fri, 17 Mar 2017 23:02:15 +0100
In-Reply-To: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1485442422-18259-1-git-send-email-vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, 2017-01-26 at 17:53 +0300, Vladimir Barinov wrote:
> Hello,
> 
> This adds the folowing:
> - R8A7796 SoC based M3ULCB board peripherals
> 
> Vladimir Barinov (4):
> [1/4] arm64: dts: m3ulcb: enable I2C
> [2/4] arm64: dts: m3ulcb: Update memory node to 2 GiB map
> [3/4] arm64: dts: m3ulcb: enable EthernetAVB
> [4/4] arm64: dts: m3ulcb: enable HS200 for eMMC

Seems these didn't hit -next just yet, for this series (tested on a
M3ULCB)

Tested-By: Sjoerd Simons <sjoerd.simons@collabora.co.uk>

-- 
Sjoerd Simons
Collabora Ltd.
