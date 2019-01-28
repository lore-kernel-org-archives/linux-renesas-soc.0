Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D798C282CD
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 18:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3CBAE20882
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 18:16:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="gKAjbRNO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfA1SQA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 13:16:00 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45971 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbfA1SP7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 13:15:59 -0500
Received: by mail-lf1-f66.google.com with SMTP id b20so12574513lfa.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Jan 2019 10:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b8vA43k+GpkwpU0HUS/z4yHprkYiWxHwQeJiC+z+lpQ=;
        b=gKAjbRNO+rXtlOIqdXsYN4wM/VHXf6q4UM9+KddzieNKTe/Q7zb5ncSBvgjGqJfAhE
         O8YXvd7J7c5Sai7+q0CbmskIDJ+xF/QNy5+L9eFz1ov0QQVoCWa0MRaZZrRos05JZZYF
         4sVRhbUcu9M8kc06H5wjMiMaw9FY0JIbmZTcuySJIXBW0uhEuxGzpmASvjEhpYJvP+an
         b+ZMguHTZxD4FY/1rfR+Swyr41s4m/NYDN9jnk72MygDE0y+X6f/wbXKKdoXzhBx/yf5
         XzK1aZf5bo6ifbXOkorKr2q4AaBW/yE0JvKIMDiqn7NssnpVhmKnWMT8l/URONeFF0pW
         NjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=b8vA43k+GpkwpU0HUS/z4yHprkYiWxHwQeJiC+z+lpQ=;
        b=MmBXGzGp7RuMUYnHBYtGmlS8wFCHKbK2G+ekWNYnoRTtosAwI/+QtZq6/lqpMZovIA
         4ODKbl9fYSiVKsAB9SnvC2MLZrjX3VFWQGS2YnbACHmm6EneA5BB8RvxeE+NkTvAWqxT
         3kvRRlATOhN0PFnWsI4v9cUBlhfR86Ch+c6/8DbSZdwc09fT+gAs1FaAp0YevxBd2yMU
         XtoGSV58Hfe56KnMPTAarlOrYUCMVOXHNnUVD5fQdnTMmTmHLPVJB2pj2ObVTXR15eqy
         0mXbE6tJlLW39sZyU7jbxuL7ZwMfD1JqZtVOg/6HO1Zf+b3q5/jrkSDeiv0aycRo5e/K
         cfEw==
X-Gm-Message-State: AJcUukfiVhX0T5QbQ7qAjp8Ag0F9JylE1pCKYuVFWYXlCvzYzC2dwklt
        CCx66Gr2eNzlny0CkDlQ978qEcbdzm4=
X-Google-Smtp-Source: ALg8bN7IukBtHlttT2pg3sdsB89tbb3HH7YzlW/r4ghZkIk4Q8Li9rZgOC8wtaYLdORwwlkATei4bQ==
X-Received: by 2002:a19:1cb:: with SMTP id 194mr17620413lfb.61.1548699357700;
        Mon, 28 Jan 2019 10:15:57 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.148])
        by smtp.gmail.com with ESMTPSA id t9-v6sm3105306ljj.87.2019.01.28.10.15.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Jan 2019 10:15:56 -0800 (PST)
Subject: Re: [PATCH] serial: sh-sci: Do not free irqs that have already been
 freed
To:     Chris Brandt <chris.brandt@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20190128175832.33670-1-chris.brandt@renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <00dc1b7b-04de-7d6b-8525-a92dbe529916@cogentembedded.com>
Date:   Mon, 28 Jan 2019 21:15:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190128175832.33670-1-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/28/2019 08:58 PM, Chris Brandt wrote:

> Since IRQs might are muxed on some parts, we need to pay attention when we

   s/are/be/?

> are freeing them.
> Otherwise we get the ugly WARNING "Trying to free already-free IRQ 20".
> 
> Fixes: 628c534ae735 ("serial: sh-sci: Improve support for separate TEI and DRI interrupts")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
[...]

MBR, Sergei

