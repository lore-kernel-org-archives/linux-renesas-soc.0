Return-Path: <SRS0=apzE=SS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685B1C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 08:11:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 335D22073F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 16 Apr 2019 08:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="tfjzIMcm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725840AbfDPIL3 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 16 Apr 2019 04:11:29 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46446 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbfDPIL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Apr 2019 04:11:29 -0400
Received: by mail-lf1-f68.google.com with SMTP id k18so6344650lfj.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2019 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E34KtiezdXZOKhsXU3LHUd4W0bToClybmQb/6XkAHTU=;
        b=tfjzIMcmVdexRAb01ifp2gZFRF82724WIEC0PIMFaLnM9156RBL54/wg3PwT/9V6d5
         TVhyAvDOCwMuM+Et/X/7WUl9aiCXebNcz6hG4QBy7He6jr/wRufQnEDkHsQlbb1UXKda
         GpTBtRnLk82NCyHukxChe0t6bTrobkVEY7Bczun75n16rsWoIXoZXEN3+PrXwG6hwJWo
         URuB4ZA+5/ugDMZqY3Y4xvS6BipLOoQXsgwVkzpRlZtLyKdikhgO5gci/90Pii15EZzj
         BzvNKJxzifEGQlrBnjjVn3Vt0vEToNWj5aU+FAzr6m93wmsesePvrA4vVu6YWbsIUIeK
         VUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E34KtiezdXZOKhsXU3LHUd4W0bToClybmQb/6XkAHTU=;
        b=YOHhntU1qM/1mx0+ZdoILNnYbrThptRqmzN/SKWi6bI64dw4oXJeSijMkUdPAZ8v5+
         fOFi0Ik2y/KRMQoRY6TRr7fxK6nY2wnLSq/wfUjNzN3K0h52PZYfRsdTvJpU1LB420Hw
         MI9eZ+wVWLfcgi/m0Ei92Vup8p6av9+xaR0lYS+jrUEUu1mGprSijsrMVrLcp26uQECP
         eksuU3g0ffjyQ4uRbJZLOI4g2BNJ//gmbFeOEr/9JmoGJceAnbT2ef60FwrQX7Zg5P64
         qSL4PcyH1+HqWWNp3rgqqLpSH6csPjaWvqHQNHaWA0vQgusQ3BsfETYCoIUoURb3ayjp
         A73w==
X-Gm-Message-State: APjAAAXUz5Nzr48q4QL73mhLR/wi31vl4hKEJn9FBcgKqskCbeMkN2Tc
        6F/wfmWXQM/BDLDvXiNMr7ZzUA==
X-Google-Smtp-Source: APXvYqw9PIMjWWeJmkdPsb5ck8YqC/xOxUwcpTyX9w34wgF3ZPdwUYZH/R6qSWTrbSnz6zarc2O1ng==
X-Received: by 2002:a19:f013:: with SMTP id p19mr10552758lfc.49.1555402287679;
        Tue, 16 Apr 2019 01:11:27 -0700 (PDT)
Received: from [192.168.0.199] ([31.173.81.188])
        by smtp.gmail.com with ESMTPSA id g26sm1136498lfh.32.2019.04.16.01.11.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 16 Apr 2019 01:11:26 -0700 (PDT)
Subject: Re: [PATCH 4/4] dt-bindings: pwm: renesas: tpu: Document
 R8A779{5|6|65} bindings
To:     Cao Van Dong <cv-dong@jinso.co.jp>,
        linux-renesas-soc@vger.kernel.org, horms+renesas@verge.net.au,
        broonie@kernel.org, geert+renesas@glider.be,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        daniel.lezcano@linaro.org, tglx@linutronix.de, robh@kernel.org
Cc:     yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
References: <1555379752-5980-1-git-send-email-cv-dong@jinso.co.jp>
 <1555379752-5980-5-git-send-email-cv-dong@jinso.co.jp>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7af00b07-f904-982f-7f05-255429e7cfb5@cogentembedded.com>
Date:   Tue, 16 Apr 2019 11:11:21 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555379752-5980-5-git-send-email-cv-dong@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 16.04.2019 4:55, Cao Van Dong wrote:

> Document the R-Car H3/M3-W/M3-N (R8A779{5|6|65}) SoC in the Renesas TPU bindings;

    s/;/./

> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
[...]

MBR, Sergei
