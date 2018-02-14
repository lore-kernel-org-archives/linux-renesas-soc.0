Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:55591 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754597AbeBNIiR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Feb 2018 03:38:17 -0500
Subject: Re: [PATCH v2 0/4] arm64: dts: renesas: r8a77995: Add VSP support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <1518550237-16753-1-git-send-email-kbingham@kernel.org>
 <2529460.tBXLBqH5B5@avalon>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <c5b387a8-008e-5cae-17e6-975d100e8159@ideasonboard.com>
Date: Wed, 14 Feb 2018 08:38:12 +0000
MIME-Version: 1.0
In-Reply-To: <2529460.tBXLBqH5B5@avalon>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On 13/02/18 22:08, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patches.
> 
>> Kieran Bingham (4):
>>   arm64: dts: renesas: r8a77995: add FCPV nodes
>>   arm64: dts: renesas: r8a77995: add VSP instances
>>   arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
> 
> Do you plan to also address r8a7795-es1.dtsi ?

Yes :-) - That pesky little extra vspd3 ...


>>   arm64: dts: renesas: r8a7796: Fix register mappings on VSP
--
Kieran
