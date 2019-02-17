Return-Path: <SRS0=hAs+=QY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0D8C10F06
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 08:47:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69DB32195D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 17 Feb 2019 08:47:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="HE9hNzGH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbfBQIre (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 17 Feb 2019 03:47:34 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37075 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbfBQIre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 17 Feb 2019 03:47:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id n23so10129982lfl.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Feb 2019 00:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ccdJx38X5P33p/STh5SsDn/S5gMGrDHiRtsyYfh/v64=;
        b=HE9hNzGHDUG3BOXYtegT4hFr1UjURJYfw1QZG0SToFp1s4UxsqBzqlJ7yc26P9l9J/
         zPwl4DzCqBIwxvHQKfDAbawvYQU2q0Vel0rOEMRR61Ib7yTWhZ8OH8+0Qlyd8XjK18kR
         hY+P2Tk412C5/uWkTD0Wgid58YGtyCrom5z43XtKjimoMXg2EXMBHqLChqgDsUq0pQuE
         1vCgZSFtSY9cXpiOibTIWkBaiV4MoP5uMO339su9vox+oy8Tw3Csv0CAvJENQp7kEY2F
         S1Lr+urvXeA9MzqGgGGETeMyd+9+AljvPemFuVr/Fo1KepSJ71NNei0Sxy/0AO9G3Js7
         eh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ccdJx38X5P33p/STh5SsDn/S5gMGrDHiRtsyYfh/v64=;
        b=YyPB9287kRYns2+wvDXI8AkIQmyiGjvqdZh3XObPQhBNrVtnL5HJYFYDV+bvfCN+gG
         argyI7T5EC25uHiRpQ+uEs/8lhCf6R6By4Fp0puX4CANih7RbhsV6OAuxHXhoQmyUQgY
         DnwTV+WrHUcS9+ddZrba60617Fh3SW8IzzIfdNfp0TYcxX8is4yEOfnaBai+w01r8/0Q
         ZSaGI4KaCtilBVsOhZ/VMhjq1lbb2x+qWRciqUpMnHvCQMxzM7ADv9EGlkl/SnijPqya
         wriPvxjDuH1OJ+73ciZxYoG82D52yluoo0goHLISGS+1HbbcIiS36t7Vq81xk1fd8JCN
         pjWg==
X-Gm-Message-State: AHQUAuZI47QvuyXQ2BgjPhnae+YAXKvnYJ1VqAnU4568ENi3Bkgq9JmS
        a3w8I1EiheNCQCWsCgXROStzOP9/rNc=
X-Google-Smtp-Source: AHgI3IYqY+JH1GKQxWiVYvfUPTQMmAy7QeS4Aqfqiz3ejQidOkL2uY0RXgVfU5mIpOCm/12FCWjyNQ==
X-Received: by 2002:a19:87:: with SMTP id 129mr10269479lfa.101.1550393251691;
        Sun, 17 Feb 2019 00:47:31 -0800 (PST)
Received: from [192.168.0.199] ([31.173.84.113])
        by smtp.gmail.com with ESMTPSA id m24sm2138726lje.13.2019.02.17.00.47.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Feb 2019 00:47:30 -0800 (PST)
Subject: Re: [PATCH] rcar-csi2: Allow configuring of video standard
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org
References: <20190216225758.7699-1-niklas.soderlund+renesas@ragnatech.se>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1a2b46e2-8d24-393d-4e7b-0b9cab777aa7@cogentembedded.com>
Date:   Sun, 17 Feb 2019 11:47:28 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190216225758.7699-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 17.02.2019 1:57, Niklas Söderlund wrote:

> Allow the hardware to to do proper field detection for interlaced field
> formats by implementing s_std() and g_std(). Depending on which video
> standard is selected the driver needs to setup the hardware to correctly
> identify fields.
> 
> Later versions of the datasheet have also been updated to make it clear
> that FLD register should be set to 0 when dealing with none interlaced

    Non-interlaced, perhaps?

> field formats.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
[...]

MBR, Sergei
