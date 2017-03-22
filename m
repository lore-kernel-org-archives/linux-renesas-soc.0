Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:35187 "EHLO
        mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758917AbdCVOJk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 10:09:40 -0400
Received: by mail-vk0-f46.google.com with SMTP id r69so15547752vke.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Mar 2017 07:09:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <PS1PR06MB1162CACF3A130AB157C200AA8A3C0@PS1PR06MB1162.apcprd06.prod.outlook.com>
References: <20170112041452.14136-1-chris.brandt@renesas.com>
 <20170118213024.qreoa5k7stjmwmr7@rob-hp-laptop> <PS1PR06MB1162CACF3A130AB157C200AA8A3C0@PS1PR06MB1162.apcprd06.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Mar 2017 15:09:17 +0100
Message-ID: <CAPDyKFqA6zwe9r8tikneL59CURETA7d50Oa1HT9zsrjyQFs9yQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sh_mmcif: Document r7s72100 DT bindings
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 22 March 2017 at 14:17, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> This one seems to have been forgotten.
>
> Should I resend with all the acks and reviews?

Seems like you didn't send it to linux-mmc, so it wasn't picked up by
the patchtracker. Please re-send so I can pick it up.

Kind regards
Uffe

>
> Chris
>
>
>
> On Wednesday, January 18, 2017, Rob Herring wrote:
>> On Wed, Jan 11, 2017 at 11:14:52PM -0500, Chris Brandt wrote:
>> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>> >
>> > ---
>> > v3:
>> > * added list of how many interrupts each SOC has
>> > v2:
>> > * added interrupt description
>> > ---
>> >  Documentation/devicetree/bindings/mmc/renesas,mmcif.txt | 8 ++++++++
>> >  1 file changed, 8 insertions(+)
>>
>> Acked-by: Rob Herring <robh@kernel.org>
>
>
>
> On Thursday, January 12, 2017, Simon Horman wrote:
>> On Thu, Jan 12, 2017 at 08:36:10AM +0100, Geert Uytterhoeven wrote:
>> > Hi Chris,
>> >
>> > On Thu, Jan 12, 2017 at 5:14 AM, Chris Brandt <chris.brandt@renesas.com>
>> wrote:
>> > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>> > >
>> > > ---
>> > > v3:
>> > > * added list of how many interrupts each SOC has
>> > > v2:
>> > > * added interrupt description
>> >
>> > Thanks or the update!
>> >
>> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
>
> On Thursday, January 12, 2017, Geert Uytterhoeven wrote:
>> On Thu, Jan 12, 2017 at 5:14 AM, Chris Brandt <chris.brandt@renesas.com>
>> wrote:
>> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
>> >
>> > ---
>> > v3:
>> > * added list of how many interrupts each SOC has
>> > v2:
>> > * added interrupt description
>>
>> Thanks or the update!
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
