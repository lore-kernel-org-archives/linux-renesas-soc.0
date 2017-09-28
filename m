Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:44121 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750946AbdI1Flt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2017 01:41:49 -0400
MIME-Version: 1.0
In-Reply-To: <20170927170145.lseodaywmmuqvmcj@sirena.org.uk>
References: <CANqRtoQjvkm4rMXt6jEaVWBeieEzqzT-yw_oARV7sj-SpTxB6g@mail.gmail.com>
 <20170927170145.lseodaywmmuqvmcj@sirena.org.uk>
From: Magnus Damm <magnus.damm@gmail.com>
Date: Thu, 28 Sep 2017 14:41:47 +0900
Message-ID: <CANqRtoQ7Q2xw5Z+mdhk8pJhx_d_PQFr-==4_YTWPK9sFfLKFuw@mail.gmail.com>
Subject: Re: Applied "spi: sh-msiof: Add compatible strings for r8a774[35]" to
 the spi tree
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-spi <linux-spi@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Mark,

On Thu, Sep 28, 2017 at 2:01 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Sep 27, 2017 at 02:36:01PM +0900, Magnus Damm wrote:
>> On Wed, Sep 27, 2017 at 2:30 AM, Mark Brown <broonie@kernel.org> wrote:
>> > On Mon, Sep 25, 2017 at 09:15:53PM +0200, Geert Uytterhoeven wrote:
>
>> >>   3. When updating DT bindings for new SoCs, we usually add "No driver
>> >>      update is needed" to the patch description to clarify. Unfortunately
>> >>      that was missed here.
>
>> > That's basically the same good practice thing, it's just documenting
>> > what you're trying to do here with not putting things in code but
>> > writing things in changelogs doesn't make them so!
>
>> My opinion that good practice is to document the per-driver supported
>> hardware by explicitly listing the per-SoC compat strings in the DT
>> binding document.
>
>> Then exactly which compat strings the driver matches on is really part
>> of the software implementation and it will most likely vary over time.
>
>> So my view is that only updating the DT binding document should be
>> enough in most cases when fall-back compat strings are used. I guess
>> other people see it differently?
>
>> Is it too much detail to let the MAINTAINERS file point out both
>> driver files and the DT binding files?
>
> It's supposed to do that already.  All I'm saying here is that the patch
> doesn't seem like something that needs actively reverting since it's a
> perfectly valid and even potentially useful change to make.

Thanks for clarifying the inclusion of DT bindings in the MAINTAINER
file. To escape any sort of conflict I will happily let you and Geert
discuss what is potentially useful or not! =)

Nevertheless I agree that reverting this rather harmless change seems
a bit overly aggressive.

Cheers,

/ magnus
