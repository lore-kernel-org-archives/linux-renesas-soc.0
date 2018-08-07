Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:53820 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbeHGPEm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 Aug 2018 11:04:42 -0400
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [GIT PULL FOR renesas-drivers] gmsl/for-renesas-drivers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20180807112508.29152-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW4xjZDL25obmSBy7FEP7NxshOzMW6ugyOA+VOzmYbdoQ@mail.gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <938c462c-6d6d-c406-95c7-440b732d9d17@ideasonboard.com>
Date: Tue, 7 Aug 2018 13:50:26 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW4xjZDL25obmSBy7FEP7NxshOzMW6ugyOA+VOzmYbdoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert

On 07/08/18 13:04, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> On Tue, Aug 7, 2018 at 1:25 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> Please consider including this release in renesas-drivers.
>>
>> This brings in our GMSL developments for inclusion in renesas-drivers, but does
>> not by default enable any FAKRA overlays. Anyone wishing to try out the GMSL
>> work must manually configure their specific camera configuration.
>>
>> Please note, this branch is based on a merge commit of linux-media/master and
>> Sakari's VC branch, and includes Niklas' conversions for adv748x to support VC
>> which are still in development as a pre-requisite.
>>
>> --
>> Regards
>>
>> Kieran
>>
>> The following changes since commit 12f336c88090fb8004736fd4329184326a49673b:
>>
>>   media: sh_mobile_ceu: convert to SPDX identifiers (2018-08-03 16:06:08 -0400)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git gmsl/for-renesas-drivers
>>
>> for you to fetch changes up to a6764190f2671dbcf86a59d42957bbcf56bb9301:
>>
>>   media: i2c: max9286: [POC] Power down GPIO lines to enable the V3M cameras (2018-08-07 12:08:12 +0100)
> 
> Thank you, this merges cleanly into today's linux-next.

\o/

> 
> Let's see how that works out in two weeks ;-)

Well - I'm sure it'll be fine .. unless Sakari updates his branch...
then it won't be fine ... :)


> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
Regards
--
Kieran
