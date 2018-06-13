Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:36912 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754495AbeFMUYu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 16:24:50 -0400
Received: by mail-lf0-f66.google.com with SMTP id g21-v6so5942321lfb.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jun 2018 13:24:49 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] Add R8A77980/Condor/V3HSK LVDS/HDMI support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
Message-ID: <9ab1470b-6c10-9d1f-e992-cc46234bae98@cogentembedded.com>
Date: Wed, 13 Jun 2018 23:24:46 +0300
MIME-Version: 1.0
In-Reply-To: <95d0db34-713d-8206-00c2-ee9a42aab823@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/13/2018 11:09 PM, Sergei Shtylyov wrote:

> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's

   Only 2, not 5 anymore. :-)

> 'renesas-devel-20180613-v4.17' tag and the Condor/V3HSK TD patches adding

   Only 1 DT patch, not 2 anymore. :-)

> Ethernet PHY IRQs. We're adding the R8A77980 FCPVD/VSPD/DU/LVDS device nodes
> and then describing the LVDS decoder and HDMI encoder connected to the LVDS
> output on the Condor and V3HSK boards.  These patches depend on the Thine
> THC63LVD1024 driver and the R8A77980 LVDS support patch in order to work...
> 
> [1/2] arm64: dts: renesas: r8a77980: add FCPVD/VSPD/DU/LVDS support
> [2/2] arm64: dts: renesas: condor/v3hsk: add DU/LVDS/HDMI support

WBR, Sergei
