Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906CFC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 18:39:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FCAB2173C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 18:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i8/9n4ai"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729066AbfBZSj1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 13:39:27 -0500
Received: from smtprelay.synopsys.com ([198.182.60.111]:46424 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728968AbfBZSj0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 13:39:26 -0500
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com [10.12.135.161])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay.synopsys.com (Postfix) with ESMTPS id 88EF310C0DE0;
        Tue, 26 Feb 2019 10:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1551206366; bh=fn+hQmXiC/8B7KXPWRA+36i9NdnGp9MIyEazx38GNtc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To:From;
        b=i8/9n4aihYkfwxN2Nr3TGfvjTzkhCdgAbtsY5AWPrGjd/zRugYMIFTmEq5JMDu8Hc
         w0DI8KytmU7WOUkXyiDa6rhgrJhuSqfC5V0KJFW1fTL3lLdaSzKtq3FZ2/2m89rvjf
         HJv6HwnjV6U3QManZOrsNev1VdBRLfAceSLRGTIKVq73M6ldXsXOf8ih6a+LsdissX
         MC72DmQWbF5UR3aS8Rmmx7QSEU5Cwhlrrf0kp5oFo93nlf9QefapqY4k+jA56VddS2
         c0Db0nmReWZX8GSj00cPwn4PHN7wQghXNjVyho/f/f+8qamMVVPZVeNvmFKVrHIEYj
         tk11lt7+Y0Fxg==
Received: from us01wehtc1.internal.synopsys.com (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mailhost.synopsys.com (Postfix) with ESMTPS id 1DA02A0097;
        Tue, 26 Feb 2019 18:39:24 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 us01wehtc1.internal.synopsys.com (10.12.239.231) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Feb 2019 10:39:24 -0800
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 DE02WEHTCA.internal.synopsys.com (10.225.19.92) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Feb 2019 19:39:22 +0100
Received: from [10.107.19.12] (10.107.19.12) by
 DE02WEHTCB.internal.synopsys.com (10.225.19.80) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 26 Feb 2019 19:39:21 +0100
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        <devicetree@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        "Luis Oliveira" <luis.oliveira@synopsys.com>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
From:   Luis de Oliveira <luis.oliveira@synopsys.com>
Message-ID: <84a5eb6b-8d5c-fc26-5e28-fadce9ff4978@synopsys.com>
Date:   Tue, 26 Feb 2019 18:39:20 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.107.19.12]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

Yes Jarkko.
Registers are on the PCLK domain (applications clock) and the IC_CLK is t=
he
clock that controls peripheral logic (like SCL definition).

Thanks!

On 26-Feb-19 14:54, Jarkko Nikula wrote:
> Hi
>=20
> + Luis from Synopsys.
>=20
> Sorry the delay, I was out of office last week. Comment below.
>=20
> On 2/21/19 6:10 PM, Gareth Williams wrote:
>> From: Phil Edworthy <phil.edworthy@renesas.com>
>>
>> The driver requires an undocumented clock property, so detail it.
>> Add documentation for a separate, optional, peripheral clock.
>>
>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>> v4:
>> =C2=A0 - Updated commit message to reference "peripheral clock" instea=
d of
>> =C2=A0=C2=A0=C2=A0 "bus clock"
>> =C2=A0 - Added Wolfram's Acked-by
>> v3:
>> =C2=A0 - Changed clocks and clock-names sections to use term "peripher=
al clock"
>> =C2=A0=C2=A0=C2=A0 (pclk) instead of "bus clock" (busclk).
> ...
>> =C2=A0 Optional properties :
>> +
>> + - clock-names : Contains the names of the clocks:
>> +=C2=A0=C2=A0=C2=A0 "ic_clk", for the core clock used to generate the =
external I2C clock.
>> +=C2=A0=C2=A0=C2=A0 "pclk", the peripheral clock, required for registe=
r accesses.
>> +
>=20
> Actually it looks there is need to revert back to bus clock (or better)=
 in
> comments but keep the "pclk" property.
>=20
> The specification I have tells the ic_clk is the peripheral clock which=
 runs the
> logic and the pclk (exactly pclk) is for bus interface and where regist=
ers are.
>=20
> Luis: did I interpret it right?
>=20

