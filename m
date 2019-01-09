Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E29C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 97A73206B6
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 12:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNNv1zEU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729816AbfAIMCF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 07:02:05 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38436 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbfAIMCF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 07:02:05 -0500
Received: by mail-wr1-f68.google.com with SMTP id v13so7397108wrw.5;
        Wed, 09 Jan 2019 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tbjNS7GqTZk7ZoP+3UmQlPWvbkXrNwlmwvUJX3Vz3xc=;
        b=cNNv1zEULjB4v4Wy0+JMOya1Oro64MK+SqlXs/FrQ54Z98WvVrxhC2ZpB6dY/NnxAw
         A8ftbJ9h72/nAjCTc/fbr5h7myHh5kOIeNmmgLwcbEh4YJZwi9b3xKnntb+Uf1ZiZRY1
         HiGRhD/JKPmX5OLVfcdJE00jATRoekjqkiMIeM7fGc9efglvZ6JNFO3FXKuA4n1Q03gw
         157s35QSAxPHVn7VtF+uIiZkP7ZVuRtAn+RvxxIYX5yeQzbDuAiTiNvPruviLORzx+9N
         DMN2HE0/jQ86Vb3QSMHMhp3XxrK/b+N2CjXU/2Hy2bwPnzEj3FgDJxMqiRytY4QiC6ko
         3o4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tbjNS7GqTZk7ZoP+3UmQlPWvbkXrNwlmwvUJX3Vz3xc=;
        b=tjHbNYTpCjCIS8s5D0Oie61ezObfhPJiZ/oJMVHjW7J11wi7vY7pwMTmmnJPhTrCPL
         bojDUXF16+KpCSnOt5hIA6jDeyolCNnxA3rMfNfif+OZV2/wIiBT4XqdohM8472VFalq
         GWAvFw9C0Fty/AHBtFzloH3O8S3JO1hYMXKGmS+rlkEkhbUqC2CkTslZQvpXaQtoipl+
         /WUIzIKL3nwsFoN6g3aBp4nuYluFD1uJVtdOjqIStmT+xOBPkAkoF37fQXH9wAvMdhDu
         BAURfR6yyakTHy2gaFPy1sOGiOEXRL7qhx3hLAVsIhw6y5KZq4quo/kzs3ENsdyLaOrX
         3U1A==
X-Gm-Message-State: AJcUukcbkRlf/+2f2GVDS1BHFhLEGyJgoN8tglfnyyK++uNhoxiIYoMz
        qwCMQ+RG8Y368SS4nbI8SUM=
X-Google-Smtp-Source: ALg8bN56r/10gCk8urIKRA/O65t9SxaXxjuPaP1eZR8z+7kZo810AfM0Gwz/O0GaLN+RlkqUmDRL/Q==
X-Received: by 2002:a5d:6244:: with SMTP id m4mr4707233wrv.314.1547035322276;
        Wed, 09 Jan 2019 04:02:02 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id s1sm83815101wro.9.2019.01.09.04.02.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jan 2019 04:02:01 -0800 (PST)
Subject: Re: [PATCH V3] arm64: dts: r8a77990: ebisu: Add and enable SDHI
 device nodes
To:     Wolfram Sang <wsa@the-dreams.de>, Simon Horman <horms@verge.net.au>
Cc:     devicetree@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181106204647.18051-1-marek.vasut+renesas@gmail.com>
 <20190109104922.z6g772vgncdqqbqt@verge.net.au>
 <20190109105754.vvqx6uvsktvxeq7a@ninjato>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <34cd1769-f0c9-0c2b-8947-4fceca9a9fb2@gmail.com>
Date:   Wed, 9 Jan 2019 13:02:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190109105754.vvqx6uvsktvxeq7a@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/9/19 11:57 AM, Wolfram Sang wrote:
>> [    3.373714] renesas_sdhi_internal_dmac ee100000.sd: mmc0 base at 0xee100000 max clock rate 200 MHz
>> [    3.456829] renesas_sdhi_internal_dmac ee120000.sd: mmc1 base at 0xee120000 max clock rate 200 MHz
> 
> No mmc2 initialized. That should work regardless of eMMC. Probably
> something wrong in the DT somewhere.

Weird, it worked in next-20181102 with these patches, I just rechecked:

7818a9f06df1 mmc: renesas_sdhi: Whitelist R8A77990 SDHI
a05a906776f8 pinctrl: sh-pfc: r8a77990: Add voltage switch operations
for SDHI
2cc9d3a293e9 pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
6b8d151613b7 pinctrl: sh-pfc: r8a77990: Add Audio SSI pins, groups and
functions
9167b22938f7 pinctrl: sh-pfc: r8a77990: Add Audio clock pins, groups and
functions
000cc50fc942 arm64: dts: r8a77990-ebisu: Enable HS200 of SDHI3
d3f59bbbf7ce arm64: dts: r8a77990-ebisu: Enable eMMC of SDHI3
5928c59bff8d arm64: dts: r8a77990-ebisu: Enable UHS-I of SDHI0 and SDHI1
dae32a3172b8 arm64: dts: r8a77990-ebisu: Enable SD card of SDHI0 and SDHI1
8feef039c6c6 arm64: dts: r8a77990: Add SDHI device nodes
25e9471b6a27 (tag: next-20181102) Add linux-next specific files for 20181102

I'll let you know once I figure it out.

-- 
Best regards,
Marek Vasut
