Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8540CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 19:08:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 520DF214C6
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 19:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="ZbkMhNTM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727290AbeL0TIb (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 27 Dec 2018 14:08:31 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37837 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbeL0TIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Dec 2018 14:08:31 -0500
Received: by mail-lj1-f196.google.com with SMTP id t18-v6so16991210ljd.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Dec 2018 11:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bcKrQ9gd67OeQw6OmETU/NRXnP2TWvhfvETyifLohbY=;
        b=ZbkMhNTM6MyxDtT4SFUONwOOPtDKS4T+JKF/syW1aKQuZX+2T2c19hRN3TfiTjmf+W
         OJPseCxndVL8TEg9R2o/iuukWWAQ/MdhEAG9ivTQqBcPuB5+ft5O1qFebthRxl/sH4/J
         li2pAyVlc6V1LIKTAAVtvkqG4yHp7NT8iLLvfLtIEvzbqIUVEwOUebW93QfG/JoUT/sX
         T38gojHRiHDtl+EoaTz+xJ87t9t45BymVXL/+foc7nYTDWx5ngWCh2z5IiCzwHZHYYh3
         EnQg5yn1RCKV8X+e6K2eJjPIBCqQ9rm1YxOX7uAMLKNrxwZlSJjbWX5/iRHWIzD4j5ne
         D7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=bcKrQ9gd67OeQw6OmETU/NRXnP2TWvhfvETyifLohbY=;
        b=cK64IJZIaI/sHq2S6PznardQ43YWekoKYsCl5UMuttNaCRBzFRjXMlZFPYChNw8zHS
         39SEKdTJjeTpDo3a0chpt8dMnm/uuJSfqfiPVRNOEqiymbi2dU6kUIS/jVyn7Iu1B6Yk
         IfOUYHhFhwKW35Ts1V1JgqVbrWQtjhB9PAjzHRr9ftQPIypDUDJW+EpK0r9Nfte6I/PV
         /R3m6ct4nwsb24BS5BibVamyVsKWtarz1v2hJbdSfF5IqK2MSbLGv3KeY5RWHWioqFS5
         GkFNwxzrZJH6uN/uDr/bq3VAfhlSRbi2puTIKF/Bvm8eG5tnBI7i8rELBAioRx2ihQYc
         SwYg==
X-Gm-Message-State: AJcUukfitlAOS5DBisy37ZoiOEojQxZZHKZsxCBdmijBuMnNBHQ+7/KQ
        RzCSMvKBECehVbCc1EN4Xgoivg==
X-Google-Smtp-Source: ALg8bN7ivjo+l8ZHRtkCF50VvKu9S85wPbxsmTtpfU6mqEli16iuiDROrHGEL58kcZeYJhsEDh9faw==
X-Received: by 2002:a2e:8945:: with SMTP id b5-v6mr11312828ljk.55.1545937709693;
        Thu, 27 Dec 2018 11:08:29 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.86.93])
        by smtp.gmail.com with ESMTPSA id d2sm7821032lfg.16.2018.12.27.11.08.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Dec 2018 11:08:28 -0800 (PST)
Subject: Re: [PATCH v4 0/2] spi: Add Renesas R-Car Gen3 RPC SPI driver
To:     Mason Yang <masonccyang@mxic.com.tw>, broonie@kernel.org,
        marek.vasut@gmail.com, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, boris.brezillon@bootlin.com,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     juliensu@mxic.com.tw, Simon Horman <horms@verge.net.au>,
        zhengxunli@mxic.com.tw
References: <1545634358-17485-1-git-send-email-masonccyang@mxic.com.tw>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4616a522-63f9-ad70-3a68-9f4d2e038750@cogentembedded.com>
Date:   Thu, 27 Dec 2018 22:08:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1545634358-17485-1-git-send-email-masonccyang@mxic.com.tw>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/24/2018 09:52 AM, Mason Yang wrote:

> Hi Mark,
> This Renesas R-Car Gen3 RPC SPI driver is based on Boris's new
> spi-mem direct mapping read/write mode [1][2].

   Against which repo/branch these pathes were generated?

MBR, Sergei
