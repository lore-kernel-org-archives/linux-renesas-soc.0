Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AA2C67839
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:00:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE465204FD
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 08:00:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="reoT0VER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE465204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726609AbeLNIAl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 03:00:41 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42525 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbeLNIAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 03:00:41 -0500
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so4086774lja.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Dec 2018 00:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KdimU5+g9fAey4NnLnw0GQwim2x8Su3ftLagt0cCjvU=;
        b=reoT0VERsdakD6+ZRSzijjjIA4xMabHvSxR+Mn4p9GI6xc+RDLdP+ufvg7zqy4S9lE
         dSNdjVlJK3GuUfqOAtfRi/xetFNBctqO9790XUI1/e79B3zlTfKmXEqoz4mkbQ3DdkMJ
         NiYLqcZJLpt0aM3StQlZ675QRcoiKPFhUFbaQc1r38JLT/LmFm8tBtFhy56uytjxw23D
         KT5ijvY2luyKha+7murCrn2Y9JluY/oteaZZ4ZoGuJjbNXBIHubodkapxFvH4V4H1Kvj
         NjkAj8IJC9l0Ll8c/fr3ib5w7NMOg3wiYiZC5ybB5gbGRmHt0bdk9RaWXSbl19BXGdyd
         vIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KdimU5+g9fAey4NnLnw0GQwim2x8Su3ftLagt0cCjvU=;
        b=A/MxDpfhV5m9hx3CpH1s4ukrS4LlBUuLqIcVr8FHe79NDXjHJlGn2g/EWvZpgbHknc
         I3an8opMYvyVxfQBeaqmXaNoP7PIQ2cxW5uyv5UvO51Hmos89mkWCm6amltLQ3pXa1qf
         jRonS9xFJnIWGUQr99CaQ3o8zojE9ioDRDjHFhw1NRZWZcs5eJ8NaJSdfZEh/KZbHvei
         qxbnDR0oHYQA5Za2zEyCXp2fcWDhxEUqftDxTkEFOS31dwbfkcTieQDhHiCnlWh5YRWh
         6NKmUTEPTbqp1JUxQUluTDUlvJ52vauvXkTZTYaXvsMMA2+SO84n1vbU69n7ui/6rTYQ
         qLjw==
X-Gm-Message-State: AA+aEWZn52L3RSaSxYLcVFHEMf29fsyoefRLFYYSJTsQzlupkkuKd118
        Hwzn38Qavpzbz+dxU4JGVO6HHw==
X-Google-Smtp-Source: AFSGD/VypK3fqoC3M7uHALwCVN8um+33WgG/fDHVEAu1dUGrVtlMq/crhjPlguJJvGEGLd85QNJZfg==
X-Received: by 2002:a2e:1603:: with SMTP id w3-v6mr1146144ljd.33.1544774438914;
        Fri, 14 Dec 2018 00:00:38 -0800 (PST)
Received: from [192.168.0.199] ([31.173.84.220])
        by smtp.gmail.com with ESMTPSA id a127sm777455lfe.73.2018.12.14.00.00.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 00:00:38 -0800 (PST)
Subject: Re: [PATCH 01/15] pinctrl: sh-pfc: r8a77994: Remove bogus IPSR9 field
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-2-geert+renesas@glider.be>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b327b5a0-5d14-447d-629a-a8f89e29dd9c@cogentembedded.com>
Date:   Fri, 14 Dec 2018 11:00:25 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.3
MIME-Version: 1.0
In-Reply-To: <20181213182714.26094-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

    like I told you on IRC, the subjects of this and next 2 patches has 
duplicate 9 in the model #s...

MBR, Sergei

