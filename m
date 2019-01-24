Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA913C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 11:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77C1420854
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 11:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="2CxCUcPF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfAXLbQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 06:31:16 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37818 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727605AbfAXLbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 06:31:16 -0500
Received: by mail-lj1-f196.google.com with SMTP id t18-v6so4912335ljd.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jan 2019 03:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3q4le4/TDaFX3wPtwOqzOy+gn8GWmVxn53VsdlZ8AYw=;
        b=2CxCUcPFzUtq7TC3691irl0caDkDC9KSiLx/NjweWFQct6ORSaDO6gSd3rr5T56F7d
         bdKgophnUrcJGaebXSWwgpcz4q5VPburqn4vbEYEl56IPGuv/FgakePczI4yfXgX+3Rh
         BjSuD811gb/FXY2ZqAuVE47PTVvUZnYdJRmq8qX/BWY6MYcR3U64sRyvczvL2arP44EC
         La3WEgCeiO/Hcy2XWd5GdpHqXxfr5axxD1z5uW6LefyPZW5+keA4aGYMaFDc6m6lTeR5
         Q0zjc5clmgzKMn+Nl7AdwlNHePt2OpuNEZFBioYiCIXHNClNHsOlRheA5sTDHnaWgMRA
         +SRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3q4le4/TDaFX3wPtwOqzOy+gn8GWmVxn53VsdlZ8AYw=;
        b=pXcRrW3mG1fReKQ4oBQKLqwl0rzukmhHWzIHyP/PYfFhJ/sIcE2t3fHYKYB/FIkGiA
         C/+JEmeJ5Vd8Efii0/RxScLrtM6oVWFRaROU6SBbZHOT+TaEgGj09tmUINEG7dnvD+pU
         jG8xLckWKgy15xFroTsaZajIlz+5GL42EK9WqQzMsidj/RmdUzdbWUFAv7qEVrpJY9/q
         +84vdgY8pfPi2v86thY0IVDeJJSFogLEsvm7PoGcGM0yhmb1tn/xb/cirFZmZPtwzTFb
         gfdmlHl3MtRhJ0t2GkCN3uModb4//+/Olx8Qp920JMb80y2l49+OYU2kNl3V8ncd+qLu
         zFhw==
X-Gm-Message-State: AJcUukcjWhEzRRFxwiPXGcrrH/+G9GffzRY/UO7GXXzUKH3qyXGZdx+O
        dfSDzl0rDC10TJNjO2B9pGFIww==
X-Google-Smtp-Source: ALg8bN6SYyOvtXojOMfv2wWgLLdmOYKE106CRU/b70GYC7qoDBuclYQyv0neY+umecJ7r6onOKLhGg==
X-Received: by 2002:a2e:5dd9:: with SMTP id v86-v6mr5244148lje.86.1548329473782;
        Thu, 24 Jan 2019 03:31:13 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.179])
        by smtp.gmail.com with ESMTPSA id i13-v6sm942307ljg.82.2019.01.24.03.31.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 03:31:12 -0800 (PST)
Subject: Re: [PATCH v7 1/2] spi: Add Renesas R-Car Gen3 RPC-IF SPI controller
 driver
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     masonccyang@mxic.com.tw, bbrezillon@kernel.org, broonie@kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, zhengxunli@mxic.com.tw
References: <1548227352-14910-1-git-send-email-masonccyang@mxic.com.tw>
 <1548227352-14910-2-git-send-email-masonccyang@mxic.com.tw>
 <bb63b646-b549-dc3b-a604-17ba156e735c@gmail.com>
 <OF767ACC95.EECC73BE-ON4825838C.000BD6A3-4825838C.000D23A6@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <93e1f97e-7afd-4a3e-b059-9f66390efa56@cogentembedded.com>
Date:   Thu, 24 Jan 2019 14:31:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <OF767ACC95.EECC73BE-ON4825838C.000BD6A3-4825838C.000D23A6@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/24/2019 05:23 AM, masonccyang@mxic.com.tw wrote:

>> [...]
>>
>> > +module_platform_driver(rpc_spi_driver);
>>
>> RPC is not a SPI controller, it's a SPI and HF controller.
>>
>> Also, how difficult will it be to add the HF support ?
> 
> One of my customers needs RPC SPI driver for our company's Octal-Flash,MX25UW51245G.
> We don't have HF product and hope you could understanding.

   I'm looking into the HF support (we have a driver internally).

> 
> thanks & best regards,
> Mason

MBR, Sergei
