Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51941 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424629AbeBOQYu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 11:24:50 -0500
Subject: Re: [PATCH v3 0/5] arm64: dts: renesas: r8a77995: Add VSP support
To: Kieran Bingham <kbingham@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <567eee0d-0f2a-cb19-4d75-812f640e7f27@ideasonboard.com>
Date: Thu, 15 Feb 2018 16:24:46 +0000
MIME-Version: 1.0
In-Reply-To: <1518602108-1724-1-git-send-email-kbingham@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 14/02/18 09:55, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
> as a dual-input image blender, while two VSPD instances can be utilised as
> part of a display (DU) pipeline.
> 
> Add support for these, along with their required FCPV nodes.
> 
> During review, Laurent noticed that the r8a7795 and r8a7796 were not mapping
> enough register space to handle RPFs with CLUT modules.
> 
> The last three patches fix this issue.
> 
> v2:
>  - Merge FCPV nodes to a single patch
>  - Merge VSP nodes to a single patch
>  - Fix VSP register map size
>  - Add fixes for r8a7795 and r8a7796
> 
> v3:
>  - Fix VSBB register map size
>  - Add r8a7795-es1 vspd3

*This* is the correct version of this series.

/me ducks....

--
Regards

Kieran


> 
> Kieran Bingham (5):
>   arm64: dts: renesas: r8a77995: add FCPV nodes
>   arm64: dts: renesas: r8a77995: add VSP instances
>   arm64: dts: renesas: r8a7795-es1: Fix register mappings on VSPs
>   arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
>   arm64: dts: renesas: r8a7796: Fix register mappings on VSPs
> 
>  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi |  2 +-
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi     |  6 +--
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi     |  6 +--
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi    | 57 ++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 7 deletions(-)
> 
