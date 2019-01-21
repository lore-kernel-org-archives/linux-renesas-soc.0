Return-Path: <SRS0=sDbg=P5=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B54EC31681
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 18:49:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 14EF020989
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 21 Jan 2019 18:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="dT6WD5jV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728201AbfAUStJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 21 Jan 2019 13:49:09 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38601 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbfAUStJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jan 2019 13:49:09 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19-v6so18411558lja.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Jan 2019 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/mbe/kYXtGbxH5uz/MVTsH8N9qQqJTlIz+IrKDBo9s=;
        b=dT6WD5jVgOd2WjhQx4l5trq9tgbyhtqpVOiFvzo0mAYoCiiYJ5d7HNU0x3HthETXW4
         ys1aaCeL2vJ6fPbZR2X0mQVAwUwIyDdbkrt7qXt+GnXRd5y6yH+y2SbBdo7E43WAen2L
         RyMAZE/mlDB1y4kVXGUbxz7IBIcoKDMFHpzDPTRTo1vIfY7gY6s4tj0hmwdV6IazVl/K
         fl3CNj5fgB4L1w2M2YvqPWXeHE0QwiOYZHYILTvK4ggumt+eq+U6xZLDqSBAz/o/GVq3
         cT2RtT3j5D+cL64yXPKKO9jThBPvFItVQzJ2LNpMH+gjatmNf5wL9pqmUWQJAHodeH12
         gq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=c/mbe/kYXtGbxH5uz/MVTsH8N9qQqJTlIz+IrKDBo9s=;
        b=r279DVDJITlvmosMWYU0vKvrku3OFTfoEKQ+Nsj9UrkqSy+DYmxEEozg/l/ybDxt9F
         RvSGsMfTL+Cqte7bGdeBzgkHCUNxW3+z7SkNXeT4EviM9v35woNzY7j14l8HMMTwzZA4
         k1UBco7QK2E4BjHX7UlIa6itlZ3isj31GkbRgElJwZDCWvQk+j+XrXnGF2kN49CyRKvi
         VTeLL6L2iWi2CJueMnnFc0j7LQ7x6S54lYJGTQqlAxM8b+OCE2MZkyDLb6XgZTGpUt7W
         knkBb2JsqrE7P2sXGfOLfpFaDe0sS0EpZU3JGLj0KC0YGjP1vCtQeTx1Xr9xhnCFjyE6
         n9Bw==
X-Gm-Message-State: AJcUukcLR+eIFZRhxWK4WRLLgX9VzojhpU+zPJqvyTDUlvhBchIodEGB
        Cj2v2af9Eq+JiWYplPv8mul8T9SaAlI=
X-Google-Smtp-Source: ALg8bN7Eq4zSy1nyNMshvcqLlyG2/4+FtmKolf8FT8JmCKnezT+8TrlN2Fzmsoa9Dv0Rooq/LQ3F5w==
X-Received: by 2002:a2e:9dcb:: with SMTP id x11-v6mr20012085ljj.158.1548096547463;
        Mon, 21 Jan 2019 10:49:07 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.215])
        by smtp.gmail.com with ESMTPSA id g24sm2389259lfh.33.2019.01.21.10.49.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Jan 2019 10:49:06 -0800 (PST)
Subject: Re: [PATCH v2 2/4] clk: renesas: rcar-gen3-cpg: add spinlock
To:     Simon Horman <horms@verge.net.au>
Cc:     linux-renesas-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com>
 <eef5ee23-311a-4367-43b5-b793357f06ef@cogentembedded.com>
 <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <54c236a3-aaa3-c8b5-786c-941a36deff6b@cogentembedded.com>
Date:   Mon, 21 Jan 2019 21:49:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20181214153332.47ukfkkgdrnsysmb@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/14/2018 06:33 PM, Simon Horman wrote:
> On Tue, Dec 04, 2018 at 10:49:44PM +0300, Sergei Shtylyov wrote:
>> Protect the CPG register read-modify-write sequence with a spinlock.
> 
> Spinlocks are expensive, I think an explanation of why this is
> necessary would be worthwhile.

   The driver using a spinlock to protect the hardware registers is such a 
common scenario, I didn't think it was worth a special explanation. :-)

> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
