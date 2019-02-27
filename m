Return-Path: <SRS0=BEXM=RC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E18DC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 09:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E3412084D
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 09:44:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f1L8weY0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729643AbfB0JoT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Feb 2019 04:44:19 -0500
Received: from smtprelay.synopsys.com ([198.182.47.9]:54420 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726845AbfB0JoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Feb 2019 04:44:19 -0500
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com [10.12.135.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id BAD0A24E220F;
        Wed, 27 Feb 2019 01:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1551260658; bh=Qartb1fl6+3Z0PhRvy65hQ1oEHFzoIopL5Q6JksUPwI=;
        h=Subject:To:CC:References:From:Date:In-Reply-To:From;
        b=f1L8weY01PxaE6FnxZBAL1Tl0NcmIaH2+NghcaLHqOMtnb2+i/2L8H+EytuacNrVi
         bpyCMmTKgpQLBvXYhdmeZWExmBn194MQb2wPrIN2odxvk04AqsB5iBGEyEsdqvLusA
         JHpTP86IqIQ9dQAgH2wCLYF2gITC2fUk6JEGVelDhXsp8ZKvP1/PfWPw3BQnc9ANT5
         LcuQF0+J4IS1gUwcF9qqp7r3vy26D+Ff/Bkff7Sy11u1+UGwOOuGGONNlZnRuL2MSw
         ObX2Mdjg+319iuvBR0Vq149EJ9iEPI99DzvNBhq9Qi2bwKDzvueRMCpiD21+MTyCZJ
         8DvJ4z2Ye4FBQ==
Received: from US01WXQAHTC1.internal.synopsys.com (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
        (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id B5393A0098;
        Wed, 27 Feb 2019 09:44:17 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 01:43:34 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 10:43:33 +0100
Received: from [10.107.19.50] (10.107.19.50) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Wed, 27 Feb 2019 10:43:33 +0100
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Luis Oliveira <luis.oliveira@synopsys.com>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
 <20190226153921.GC839@kunai>
 <8ad4aca6-cdbd-d2bf-81e2-5e2cd04a05c0@linux.intel.com>
From:   Luis de Oliveira <luis.oliveira@synopsys.com>
Message-ID: <a05b567d-0db9-d1a5-f793-db804c66f311@synopsys.com>
Date:   Wed, 27 Feb 2019 09:43:31 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <8ad4aca6-cdbd-d2bf-81e2-5e2cd04a05c0@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.107.19.50]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

Thanks Jarkko.
Yes, "interface clock" for pclk seems good.

Thanks,
Luis

On 27-Feb-19 7:10, Jarkko Nikula wrote:
> On 2/26/19 5:39 PM, Wolfram Sang wrote:
>>
>>>> + - clock-names : Contains the names of the clocks:
>>>> +=C2=A0=C2=A0=C2=A0 "ic_clk", for the core clock used to generate th=
e external I2C clock.
>>>> +=C2=A0=C2=A0=C2=A0 "pclk", the peripheral clock, required for regis=
ter accesses.
>>>> +
>>>
>>> Actually it looks there is need to revert back to bus clock (or bette=
r) in
>>> comments but keep the "pclk" property.
>>>
>>> The specification I have tells the ic_clk is the peripheral clock whi=
ch runs
>>> the logic and the pclk (exactly pclk) is for bus interface and where
>>> registers are.
>>
>> Can we make it "bus interface clock" then? I'd think this is a tad
>> better.
>>
> Yes, that makes it clear. Plain "interface clock" might work too. TI OM=
APs are
> using that term for register access clock domains.
>=20
> Luis: Does that make sense for HW point of view? You mention PCLK is ca=
lled also
> as application clock but for me personally it is not as clear as interf=
ace clock
> when I see it. I'll let Luis have the final word here.
>=20
> ic_clk - peripheral clock
> pclk - (bus) interface/application clock
>=20

