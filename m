Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:35593 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751389AbeEPNHC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 May 2018 09:07:02 -0400
MIME-Version: 1.0
In-Reply-To: <20180411090122.GK6436@w540>
References: <1522759385-17661-1-git-send-email-ykaneko0929@gmail.com> <20180411090122.GK6436@w540>
From: Ulrich Hecht <ulrich.hecht@gmail.com>
Date: Wed, 16 May 2018 15:07:01 +0200
Message-ID: <CAO3366w6jfL4W5i_ezoL0s6_1Rrc0RssHyc0p2zhKQcicpzNqQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v3 0/3] thermal: add support for r8a77995
To: jacopo mondi <jacopo@jmondi.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 11, 2018 at 11:01 AM, jacopo mondi <jacopo@jmondi.org> wrote:
> Hello Kaneko-san,
>
> On Tue, Apr 03, 2018 at 09:43:02PM +0900, Yoshihiro Kaneko wrote:
>> This series adds thermal support for r8a77995.
>> R-Car D3 (r8a77995) have a thermal sensor module which is similar to Gen2.
>> Therefore this series adds r8a77995 support to rcar_thermal driver not
>> rcar_gen3_thermal driver.
>
> I tested this on D3 Draak.
>
> I generated load expecting the detected temperature to rise.
>
> It took a while, and I only see a slight increase of the temperature
> reported by the 'temp' attribute.

Pointing a heat gun at the SoC, I managed to get the temperature up to
80000, and it went back to 40000 when I removed it. I'd say this
works.

Tested-By: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

CU
Uli
