Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A87C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 20:08:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 22EDF20874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 20:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9LKLDyq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388901AbeLQUIl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 15:08:41 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40508 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727038AbeLQUIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 15:08:41 -0500
Received: by mail-pl1-f196.google.com with SMTP id u18so6641752plq.7;
        Mon, 17 Dec 2018 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Td7CMjil7PGDNDB5+KV5ZKI38FHaA5MlPnQZfQXYCY8=;
        b=E9LKLDyqNuZ4Pw9Bu3nm+NMu/8WZHMm3mXR76mct9MvTGUKE6/i/Mcn8NKirAsEN6b
         61D2DdK4FIL81wNnzfNfpRzIvR+1jENDKgvX9s31MRMyWR8Jn3hWXqG+r4/BRQ1L07Ws
         KcgnfEDloIVfcEB3+txypADefDaAD24axoOGVNJHn8wSvl8jqHXxbYNprHwGIGikiO8x
         ig6qAUhVbseFK4IOIlouxBlfOv678waJYPFMIMUspegjv74Ujy+/N85re15vOcCZ/xUy
         DUxNNMcqEjRUAiPB+g7hGQJZfkfJOO79ZGv/2gy7dYNhqnTvS2nErb32SNE4UYO1AbLB
         rm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Td7CMjil7PGDNDB5+KV5ZKI38FHaA5MlPnQZfQXYCY8=;
        b=t7Pox7NA6doB2iradZjLdAMcP7KNWuyBwUBIhis4UB1HCFmmEyWkKsSswbZQOfknDh
         V7FsqAFVwV9oDnonzojYDR3E4Ic8pM89qC7Eo0Ty3Y8bHy9UK7VHnM9nrqRtZ8DK7RX+
         UmUKk6YxLpIYqci2+psJqgboZiBnoKYsGClmxvk1hfeSRcXIC67STxikQva4FsaPvD7R
         KbHt83A0EsDA5vfcUZAo1BjKroYZTKvu59Wsmpu78+Bq5coHBlgzQsBAr/eTH/1oZtHl
         4IR5KKN1xpfCarsToVYHqpEj32M/TheMFujJS+67iNwSNX4I5VJsjsWTQCg1Zl13cihb
         4wiQ==
X-Gm-Message-State: AA+aEWYostzxR6wbZUI+0Ark3s4k6Ru4FyQfe48q3Wz9RrM9GJ4igg5P
        /TBDpT+biX3/t9YAuy0c8YQ=
X-Google-Smtp-Source: AFSGD/XAqsQmvMYM3hPx1UnXeLPq3lk4tns4PSVOQqC1lAtbxzSuKGM6eS305r2L9PS0lrmniVS51Q==
X-Received: by 2002:a17:902:8e8a:: with SMTP id bg10mr13939205plb.192.1545077320877;
        Mon, 17 Dec 2018 12:08:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p2sm18497180pfp.125.2018.12.17.12.08.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 12:08:40 -0800 (PST)
Date:   Mon, 17 Dec 2018 12:08:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-watchdog@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH] watchdog: add documentation for PM usage
Message-ID: <20181217200839.GB29585@roeck-us.net>
References: <20181217193314.3487-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181217193314.3487-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 08:33:14PM +0100, Wolfram Sang wrote:
> Add the first rule we recently agreed on.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/watchdog/watchdog-pm.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/watchdog/watchdog-pm.txt
> 
> diff --git a/Documentation/watchdog/watchdog-pm.txt b/Documentation/watchdog/watchdog-pm.txt
> new file mode 100644
> index 000000000000..7a4dd46e0d24
> --- /dev/null
> +++ b/Documentation/watchdog/watchdog-pm.txt
> @@ -0,0 +1,19 @@
> +The Linux WatchDog Timer Power Management Guide
> +===============================================
> +Last reviewed: 17-Dec-2018
> +
> +Wolfram Sang <wsa+renesas@sang-engineering.com>
> +
> +Introduction
> +------------
> +This document states rules about watchdog devices and their power management
> +handling to ensure a uniform behaviour for Linux systems.
> +
> +
> +Ping on resume
> +--------------
> +On resume, a watchdog timer shall be reset to its selected value to give
> +userspace enough time to resume. [1] [2]
> +
> +[1] https://patchwork.kernel.org/patch/10252209/
> +[2] https://patchwork.kernel.org/patch/10711625/
> -- 
> 2.19.1
> 
