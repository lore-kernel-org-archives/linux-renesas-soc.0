Return-Path: <SRS0=aa6b=BQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6D6C388F9
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Aug 2020 11:13:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D5CB22D02
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  6 Aug 2020 11:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvsmESMd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729274AbgHFJz1 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 6 Aug 2020 05:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729288AbgHFJzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 05:55:19 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02806C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Aug 2020 02:55:19 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id b30so25794170lfj.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Aug 2020 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iLnO85sDWXnc5STHtwImT7+YI1lTMI4nQkXxGiWw4yQ=;
        b=nvsmESMdl5RAq10DE60VGnhFNPgI8dMtwtCGnrqVlmsKrV1wLx1jyUtzCcLK39LHWx
         jlSTxB3xnGq+7T41XmrqoI3ddOANsomxvEtKRMpe7gkxFajnmlNu/+TgoPJfMpmTsPEQ
         qA0dANHTJ0XIhEVE2IoeP6UFW20IvHXfIBnGWon+JNIhIP5tnridb2IvIEIGkmb60QIm
         Lk7/9dqDZEeXCLIQsj6CEhnUthx48qsVVpnSyaPWSdKegLkIfsE9tnZSr11CKDhvtgcd
         a0mqYJGnMkjE41f7AT/xbttcyV+CcjOFdc7C7E9I82AQfqSEcZO5F8nRINaj6ECyDz0N
         hU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iLnO85sDWXnc5STHtwImT7+YI1lTMI4nQkXxGiWw4yQ=;
        b=CdUIzCjfmLFsfAZcA8BFlii5hgz6IM/+gb3v1RVCaP+9pv10YslQhlFgMK+gmrK8K7
         HAj/aFpMXPtADbzuVOsnxHp8yYUlyMXozti2kIPwQzU7T0Fw/p1Dq2rxhJVMqH6gkf+R
         VRCUTwJjasUQn8DMObzM5QPMDQxfZuhpo8sHByQoha3SvC008GweFP0jTr5PT7l7sm83
         YttLDsobZ9TIzN3LyHikZq1B3HNWhlLXYjA4OzLawVZV9SxAtyTFaGJmp4RpgmtvQPMA
         J6rGretgKOYVMJvIeLVmIQ0w6M1EVNAw1lXCfQQUGuuQ1z1EaOXJh1phHDwkEKoGwD9Z
         +Huw==
X-Gm-Message-State: AOAM531EgT3tmbS6q6tSmJ+t27Dgavxz+9WDdPDfKHKFnBFyILI4LOF3
        ox7sgXGdty+b+NygMItuLDAwaxU2
X-Google-Smtp-Source: ABdhPJzDdypt2ZljenRGREuPMirGGHnsauTQZo/TqPzm2uCRxxQhf6tfTvI0RkyPjiLn57s/1Xaalw==
X-Received: by 2002:ac2:4a9d:: with SMTP id l29mr3531692lfp.23.1596707717352;
        Thu, 06 Aug 2020 02:55:17 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42cb:55ed:b0ec:135a:626d:113? ([2a00:1fa0:42cb:55ed:b0ec:135a:626d:113])
        by smtp.gmail.com with ESMTPSA id f14sm2476121lfd.2.2020.08.06.02.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2020 02:55:16 -0700 (PDT)
Subject: Re: [PATCH 1/8] card: Add a method to retrieve the device minor
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-renesas-soc@vger.kernel.org
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
 <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <c7aa64ac-d1b6-9c2c-3d28-c2974f096772@gmail.com>
Date:   Thu, 6 Aug 2020 12:55:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200806021807.21863-2-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06.08.2020 5:17, Laurent Pinchart wrote:

> The device minor number is needed to access the debugfs directory
> corresponding to the device. Make it available to users through a
> get_minor() method on the Card object.

    Didn't you call it dev_minor() below?

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[...]
> diff --git a/kms++/inc/kms++/card.h b/kms++/inc/kms++/card.h
> index 5c1cf7cfcedc..0a11747f7985 100644
> --- a/kms++/inc/kms++/card.h
> +++ b/kms++/inc/kms++/card.h
> @@ -35,6 +35,7 @@ public:
>   	Card& operator=(const Card& other) = delete;
>   
>   	int fd() const { return m_fd; }
> +	unsigned int dev_minor() const { return m_minor; }
>   
>   	void drop_master();
>   
> @@ -84,7 +85,9 @@ private:
>   	std::vector<Framebuffer*> m_framebuffers;
>   
>   	int m_fd;
> +	unsigned int m_minor;
>   	bool m_is_master;
> +	std::string m_device;
>   
>   	bool m_has_atomic;
>   	bool m_has_universal_planes;
[...]

MBR, Sergei
