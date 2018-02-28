Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:45267 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934320AbeB1R5W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Feb 2018 12:57:22 -0500
Received: by mail-lf0-f45.google.com with SMTP id h127so3770882lfg.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Feb 2018 09:57:22 -0800 (PST)
Subject: Re: [PATCH v2 0/5] Add R8A77970/V3MSK LVDS/HDMI support
To: Simon Horman <horms@verge.net.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
References: <23a6ac28-134b-b5dd-69a7-910774c4b8c1@cogentembedded.com>
 <2fd26075-525c-8d86-ef81-f32c73cf3e8b@cogentembedded.com>
 <20180228132707.mgunezg5o4lul7x5@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f9574ea2-d8ee-7c9f-b850-874074eddad2@cogentembedded.com>
Date: Wed, 28 Feb 2018 20:57:18 +0300
MIME-Version: 1.0
In-Reply-To: <20180228132707.mgunezg5o4lul7x5@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/28/2018 04:27 PM, Simon Horman wrote:

>>> Here's the set of 5 patches against Simon Horman's 'renesas.git' repo's
>>> 'renesas-devel-20180227-v4.16-rc3' tag. We're adding the R8A77970 FCPVD/VSPD/
>>> DU/LVDS device nodes and then describing the HDMI encoder connected to the LVDS
>>> output (we're omitting the LVDS decoder for now). These patches depend on
>>> the recent R8A77970 DU/LVDS rework patches by Laurent in order to work...	
>>
>>    Need to mention that the DU driver silently fails to probe now. I do
>>    hope that this is not due to my updates. :-)
> 
> Please test that theory.

   Yeah, after sucking in the recent versions of the DU/LVDS patches and uncommenting
and fixing rejects in a couple patches here, the graphical console works again. :-)

MBR, Sergei
