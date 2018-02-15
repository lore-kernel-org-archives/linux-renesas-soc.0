Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:51934 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424203AbeBOQXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 11:23:53 -0500
Subject: Re: [PATCH v2 0/4] arm64: dts: renesas: r8a77995: Add VSP support
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1518550237-16753-1-git-send-email-kbingham@kernel.org>
 <10b1154e-a5fd-133d-b90f-81f82681cf37@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <6ec4ae9b-0bcf-93c1-21af-24fed24ea2d7@ideasonboard.com>
Date: Thu, 15 Feb 2018 16:23:49 +0000
MIME-Version: 1.0
In-Reply-To: <10b1154e-a5fd-133d-b90f-81f82681cf37@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 15/02/18 16:21, Kieran Bingham wrote:
> Hi Simon,
> 
> This the correct version of this series.


**** LIES ****

Sorry - My hands were quicker than my head there.

*this is not the lastest series*.

--
Kieran



> 
> --
> Regards
> 
> Kieran
> 
> On 13/02/18 19:30, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> The r8a77995-d3 platform supports 3 VSP instances. One VSPBS can be used
>> as a dual-input image blender, while two VSPD instances can be utilised as
>> part of a display (DU) pipeline.
>>
>> Add support for these, along with their required FCPV nodes.
>>
>> During review, Laurent noticed that the r8a7795 and r8a7796 were not mapping
>> enough register space to handle RPFs with CLUT modules.
>>
>> The last two patches fix this issue.
>>
>> v2:
>>  - Merge FCPV nodes to a single patch
>>  - Merge VSP nodes to a single patch
>>  - Fix VSP register map size
>>  - Add fixes for r8a7795 and r8a7796
>>
>> Kieran Bingham (4):
>>   arm64: dts: renesas: r8a77995: add FCPV nodes
>>   arm64: dts: renesas: r8a77995: add VSP instances
>>   arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
>>   arm64: dts: renesas: r8a7796: Fix register mappings on VSPs
>>
>>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  |  6 ++--
>>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  |  6 ++--
>>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 57 +++++++++++++++++++++++++++++++
>>  3 files changed, 63 insertions(+), 6 deletions(-)
>>
