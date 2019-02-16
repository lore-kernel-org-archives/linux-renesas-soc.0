Return-Path: <SRS0=vwki=QX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F64C43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40D41222E0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Feb 2019 14:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHf/ZWsp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfBPOAV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Feb 2019 09:00:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42877 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfBPOAV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Feb 2019 09:00:21 -0500
Received: by mail-wr1-f67.google.com with SMTP id q18so13192551wrx.9;
        Sat, 16 Feb 2019 06:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HC1DbdIzbcG9diipDrToLB+4fVLUmh1YzFBsg3KnqyA=;
        b=dHf/ZWsptbFQY4KfJnSn6pwpTEtPmiE6ypCZRLv4G15SLF7z0Bv7JPVoAx0j8DMsmk
         lYzM388zuM2cq9o6Z/mzXoza7qxWB80jUdXRihw1z7VMAimlBgiN9hgFYh1S8h4D2v8f
         yJSY7dXZB0iVyZvDSFhE814rI/4IaHFLrQpz/9eS1BZi/WdNFbhxYVQgovoXsiFb6/Mh
         VzVFhP+tW2jYYGX9uzhJzNgvyJCfVRjNrHfWIg2It2pTxOoNZsrGjj1XyiarptsVnNka
         mS51528LtsOG7mXLQVljTiOZOKrUpRz8eRbhHNK75+zCPqfGeweiywMk+jj/1qQofuOc
         wAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HC1DbdIzbcG9diipDrToLB+4fVLUmh1YzFBsg3KnqyA=;
        b=Mi7apdzeYdBYJ2Q976JMTzHXSIOcZzVCTkm8YX5ONE81wVdMmotwTikh5iVoP4lf9e
         Die/SL577En3AcXQ5PfRcILEGY8HiYXoRnqPJssL5WTfr+0/6nYv91saC33Vfj1GfKrL
         NxXtksna+HmIK7YMRhDRx3CcaTklV0FGEpR+SR7UokkKtf097AWVWue+OChvKsTViiWf
         hqYhkz0PhV5QMXHTOqu5VxZNVUYLT2iKJGxFGTc+37Au4arKUrVANYNIgAaRd1evFD5s
         q/A1PKMzzF3kExUvAvAsMWx+4i9kLAIBQQR5gTzhD80sVvhVhzMnYtTVnGjaB+9Pnpnt
         SSsQ==
X-Gm-Message-State: AHQUAuazR4Ot4BQXQRMxG5DxVPwTcFJYKrDto1sxCYMWJHnVc1t7st3W
        HHtzZy5tkwh+gL6V6u9ocpOwQ8Ha
X-Google-Smtp-Source: AHgI3IZr/n/ZQIo6gXkRBS4+N1XnpBKZ9dh9d/zXXPXQtXp60yn2QP+zIiV/EeYLTbQ1RTfM7vtjNQ==
X-Received: by 2002:adf:f28f:: with SMTP id k15mr10780326wro.272.1550325618948;
        Sat, 16 Feb 2019 06:00:18 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id h142sm14402925wme.33.2019.02.16.06.00.17
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Feb 2019 06:00:18 -0800 (PST)
Subject: Re: [PATCH 2/2] dt-bindings: can: rcar_canfd: document r8a77990
 support
To:     Simon Horman <horms@verge.net.au>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
 <20181118173201.4645-2-marek.vasut+renesas@gmail.com>
 <20181121102017.hza4czc3cnqtfyxn@verge.net.au>
From:   Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <168f18bc-d104-bc1d-980c-93a10c82c775@gmail.com>
Date:   Sat, 16 Feb 2019 15:00:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20181121102017.hza4czc3cnqtfyxn@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/21/18 11:20 AM, Simon Horman wrote:
> On Sun, Nov 18, 2018 at 06:32:01PM +0100, Marek Vasut wrote:
>> Document the support for rcar_canfd on R8A77990 SoC devices.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>> Cc: Eugeniu Rosca <erosca@de.adit-jv.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Simon Horman <horms+renesas@verge.net.au>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: devicetree@vger.kernel.org
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

This patchset seems to be missing upstream.

-- 
Best regards,
Marek Vasut
