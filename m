Return-Path: <SRS0=bVnl=PQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB80C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 07:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF32C2183F
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Jan 2019 07:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="j2vw8BQ3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfAHHwe (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Jan 2019 02:52:34 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46904 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727673AbfAHHwe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Jan 2019 02:52:34 -0500
Received: by mail-lf1-f65.google.com with SMTP id y14so2182856lfg.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Jan 2019 23:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pwvF6kuc4USL+DB3aRUPohmFgbFwH+iwGLnnxPrvfbY=;
        b=j2vw8BQ3Jt+QfxP16lileseQtVD0BUWSxZmNuTMWJj/BiBXqC9laEndnt8G7alk8wK
         XZJn8Nb0a8bGHXW1tF8VisjXlna1jAQhzmr42jjdz/jncEaRLcaIMwTiMnPrgz3mP4no
         5iLeGcVifPY8Bd8t3J7fhrJOifLYGhs3zVepCnS3xhHDRGxdVLXHX8PD9RD/OQlNREpL
         ZsWWVFT4wKsDmIL5ftR7DZhNL+D8UgWVPxhnpDkuAEH6NR6TPuEm4y/P2vKWNS8HJdrx
         ZvkyteoOSMSFb8Bh76xXdbDvmhpgO5UxlkuYFCDUrDRAJmfnZP5s8KtjvR/x0/8QFrgw
         dseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pwvF6kuc4USL+DB3aRUPohmFgbFwH+iwGLnnxPrvfbY=;
        b=PPU2eUJFRNoqST6elFy5mqw7eCNTNRRnIvfyfJFaUgOgf9v/GrTX275ZpQpacbUXJ6
         jcAvaKjQUwDQO2XrxT7/LHT+Zc18I5jKnbGZv5LbhOqDlp+pv2DHiFN87Cr1Z1wdiGa2
         B3euqDiuFIudNQ1z9vvHdKdVwFzae3bjeITGZVMUAdHtunnZQ8GZpyrYD02Af02ioILr
         sai5Xua2gdQheMOINVHKTU1YYl1GJW1Lo9CVFw1xZgkgwVt9+OpWgu8PQuJ9RSZpcGZE
         FJHzHsi7Kckp3lkdblpljLTCQhApYFQYnOy//r2uutPr2JqB+GJZkwWcusFSDUUtQINL
         V1Ug==
X-Gm-Message-State: AJcUukeVluagVanrwbrg10a5OigM8rfW0PSEJDH/8s3/Ot1w950OgypB
        +fiqv5ywTcLOl6zbr7xrkfmsJUn2+88=
X-Google-Smtp-Source: ALg8bN5D+5b/5+0ACuyEUBCY5eilygrKTVXPcYbLXSL3gIOqn3FTpYgLsz6liQlzI+taYAiW1/ORgQ==
X-Received: by 2002:a19:f20:: with SMTP id e32mr435918lfi.51.1546933951863;
        Mon, 07 Jan 2019 23:52:31 -0800 (PST)
Received: from [192.168.0.199] ([31.173.84.204])
        by smtp.gmail.com with ESMTPSA id r26-v6sm14442619lji.25.2019.01.07.23.52.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jan 2019 23:52:30 -0800 (PST)
Subject: Re: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org
References: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
 <20190107181505.GR9570@sirena.org.uk>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e56eec35-9628-9c75-4a8d-685ffef5e2b9@cogentembedded.com>
Date:   Tue, 8 Jan 2019 10:52:11 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190107181505.GR9570@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 07.01.2019 21:15, Mark Brown wrote:

> On Thu, Dec 27, 2018 at 11:21:14PM +0300, Sergei Shtylyov wrote:
> 
>>   drivers/spi/spi-renesas-rpc.c |   66 ++++++++++++++++++++++++++----------------
> 
> This does not exist upstream.

    As I said, the patch was atop of the RPC-IF driver patch by M. Yang.

MBR, Sergei
