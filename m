Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F52C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:58:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 25826218AC
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 13:58:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2+1v8X3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbfBPN6X (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 08:58:23 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39560 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfBPN6X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 08:58:23 -0500
Received: by mail-wr1-f66.google.com with SMTP id l5so12132987wrw.6;
        Sat, 16 Feb 2019 05:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NtCCEltOnKXz7iyH1UZUBp4GY+04t5E0/xBMMWHGRfw=;
        b=J2+1v8X3IHuo0hPTzhrxRRMr4HzhHMkyYnAamJvKyIFmbRdfKPgMyd8KnirDlbsWg4
         uMRn0U+JHQLVilT6wdHDHetPd5Bm45HnXZ3PyMbbM7n/54jivglYy4ZYY22YM1LirljN
         ULHlR2gZ1vssylIpPEHGup0DXU/nRsubBjOY9hDbArzdkPslaxXX15FrXqEo0q6Y1lMH
         0A+oKGnrSSyLjhTIGuNMHo4aeDxIFE409KLA5hhnQHXUac0FlR3xSPRDAQxWZs//cAG6
         /rZDCDEPJW2hH1uCMdhKxhDRaCy/9RbqZ/lBA+V/Abix0Sz1U1xomiGsrwqiJsKTIumn
         dM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NtCCEltOnKXz7iyH1UZUBp4GY+04t5E0/xBMMWHGRfw=;
        b=O0RzGRpL7KH50vc2TaWerLyOEmQqjVJBNiIlzNMpu46MCmWw8Gh9XdqiQ7z/3ByZdm
         IF8Ad0UJfSbMkUD1L/1+golYvC8wwlkNeyfVuDFkfC3eKv18s+1ZJKh+rlSN7uOQpGbQ
         mPaM6EM6RBCSgIR0JkPRNEMe1nRe6qEEDVSJN4lZiAwZFn4iFbBNpNrO//qco7/k320M
         tjDon1gqO52D8Jmy8vLsOkU08KSOJx5s4p60AI4yB80vx5isymqjw1yci/WqyGgj0WS3
         AsSOfjLmoTT4WOk45Wi41nHqlndi+loEpZNxUEkIZWi2mwftARRE/JWMvJdPJBDFNG37
         Y5Lw==
X-Gm-Message-State: AHQUAuYqIFFHLOBRG6jREZD6bvy8X6lNZnz6uvMp8vPcSGyiU9xQR2jl
        Vms4KF7FZDqKjC8XiH0XYNosyjql
X-Google-Smtp-Source: AHgI3IZbEtvXqUyB3kGv49EkeqByo7AVEBh0ACrQgiWTYfgQZNSck79asDD7l2yWIIOuw2U5K8s7uQ==
X-Received: by 2002:adf:c18c:: with SMTP id x12mr10895527wre.152.1550325501025;
        Sat, 16 Feb 2019 05:58:21 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id k20sm15865689wre.41.2019.02.16.05.58.19
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 05:58:20 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: can: rcar_can: document r8a77990 support
To:     Simon Horman <horms@verge.net.au>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181118173056.4591-1-marek.vasut+renesas@gmail.com>
 <20181119104243.csnkooxolkple2ln@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <499ffcf5-0617-a142-914d-afee88c2127b@gmail.com>
Date:   Sat, 16 Feb 2019 14:58:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20181119104243.csnkooxolkple2ln@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/19/18 11:42 AM, Simon Horman wrote:
> On Sun, Nov 18, 2018 at 06:30:56PM +0100, Marek Vasut wrote:
>> Document the support for rcar_can on R8A77990 SoC devices.
>> Add R8A77990 to the list of SoCs which require the "assigned-clocks"
>> and "assigned-clock-rates" properties.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> ---
>>  Documentation/devicetree/bindings/net/can/rcar_can.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
This patch seems to be missing upstream ?

-- 
Best regards,
Marek Vasut
