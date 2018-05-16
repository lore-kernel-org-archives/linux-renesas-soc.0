Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:41819 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751717AbeEPTIK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 15:08:10 -0400
Received: by mail-wr0-f195.google.com with SMTP id g21-v6so2844560wrb.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 May 2018 12:08:09 -0700 (PDT)
Date: Wed, 16 May 2018 21:08:06 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Ulrich Hecht <ulrich.hecht@gmail.com>
Cc: jacopo mondi <jacopo@jmondi.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH/RFT v3 0/3] thermal: add support for r8a77995
Message-ID: <20180516190806.GA17838@bigcity.dyn.berto.se>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com>
 <20180411090122.GK6436@w540>
 <CAO3366w6jfL4W5i_ezoL0s6_1Rrc0RssHyc0p2zhKQcicpzNqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO3366w6jfL4W5i_ezoL0s6_1Rrc0RssHyc0p2zhKQcicpzNqQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On 2018-05-16 15:07:01 +0200, Ulrich Hecht wrote:
> On Wed, Apr 11, 2018 at 11:01 AM, jacopo mondi <jacopo@jmondi.org> wrote:
> > Hello Kaneko-san,
> >
> > On Tue, Apr 03, 2018 at 09:43:02PM +0900, Yoshihiro Kaneko wrote:
> >> This series adds thermal support for r8a77995.
> >> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
> >> Therefore this series adds r8a77995 support to rcar_thermal driver not
> >> rcar_gen3_thermal driver.
> >
> > I tested this on D3 Draak.
> >
> > I generated load expecting the detected temperature to rise.
> >
> > It took a while, and I only see a slight increase of the temperature
> > reported by the 'temp' attribute.
> 
> Pointing a heat gun at the SoC, I managed to get the temperature up to
> 80000, and it went back to 40000 when I removed it. I'd say this
> works.

I like your style! I contemplated using a hairdryer when testing some 
Gen3 thermal work but decided against it. Good too see others are not as 
weak minded as my self :-)

> 
> Tested-By: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> CU
> Uli

-- 
Regards,
Niklas S�derlund
