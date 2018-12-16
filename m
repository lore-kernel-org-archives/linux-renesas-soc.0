Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1921C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 02:22:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 697222084D
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 02:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=landley-net.20150623.gappssmtp.com header.i=@landley-net.20150623.gappssmtp.com header.b="T9tsWGnJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbeLPCWp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 21:22:45 -0500
Received: from mail-it1-f196.google.com ([209.85.166.196]:56074 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728203AbeLPCWp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 21:22:45 -0500
Received: by mail-it1-f196.google.com with SMTP id o19so14356281itg.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 15 Dec 2018 18:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=landley-net.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QLEzE1gs14L451hGTts5hkde1NU2Nqbf9O9ZmCLqUmg=;
        b=T9tsWGnJ794c6M36K55byWDJdgGRIpirOqrAJyfy6AAh3ZM4120u5Mraj8uXsKfXHK
         KxUY/DC0e1Rd1rdLeyGTqimxb8dnLFYvTNVrBvF3AYS0So9xAxNDPj261EHEuqAW/r/4
         4mCl4wVRFPK+YFFHAhMGtU+1YVQhDp9kZqRlSe0wZbdskee6o1aBiwLjskEvp89DdGYc
         1nbKxpL2znV6CQdo0G+tv3Smiuld0B7utQGYQNqIr2yj+dz8z/CgvGrlIczEA/NWNdu3
         dEZAQO6/wJqKF0j14or9koTCsdXBoouRk3eb6sjNQE0RkNYl2lnDDGSxRnPyg06lLwMX
         neWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QLEzE1gs14L451hGTts5hkde1NU2Nqbf9O9ZmCLqUmg=;
        b=g7UqE09AWty9RPE8aizOMZf3RjLMVY5UIK+Gb0JN0oA1IxVh9zwzK/Nu/1CNv11cgu
         fIY6DcxvXw8ticH0/eevoUBisUSwlLDl/HZRxgupbgJSadIY5PYEZZd81Ahc0QnKMGfn
         xHaEk1oLww1H7wNZliG8xfuDylABUfYDUsP/XqOArFfSk/LkhFmmzaSMunOC5v+EYNsl
         4FBH+E9yVut9KdlH5k2jGsX4pVz5UAx+VpHfFeSAA/EUI4zfmuTXF7ycH8tPB4AK262S
         UIIHQuKPxzxagS8XVRLTBBYbH8bTO91RJAuUFHdpO0Etog8XcSerQekYihYxo3/mtpBZ
         6frw==
X-Gm-Message-State: AA+aEWYwmPz9ereEfKjDA7oeZS43anK2+WosVNqUerXqm1uCKTUKVvhJ
        LnCZ8z8jZJABJoDbw8/0U/vnRjq97ec=
X-Google-Smtp-Source: AFSGD/XLYKuoVMzdVO1Oyf28mlb/tBL0zJN8dK2etataJcvrd/zic5ApZYA/tPleQl++bKtIALd1Jw==
X-Received: by 2002:a02:7127:: with SMTP id n39mr7798070jac.91.1544926964462;
        Sat, 15 Dec 2018 18:22:44 -0800 (PST)
Received: from [192.168.43.100] ([172.58.139.65])
        by smtp.googlemail.com with ESMTPSA id g12sm3749656iok.38.2018.12.15.18.22.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 18:22:43 -0800 (PST)
Subject: Re: [PATCH v4 0/4] serial: sh-sci: Fix fallback to PIO on DMA failure
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20181213184444.21904-1-geert+renesas@glider.be>
From:   Rob Landley <rob@landley.net>
Message-ID: <c6dd8a4a-234c-ff1e-0d22-7af61dcec427@landley.net>
Date:   Sat, 15 Dec 2018 20:22:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213184444.21904-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/13/18 12:44 PM, Geert Uytterhoeven wrote:
> 	Hi Greg, Jiri,
> 
> When submitting a DMA request fails, the sh-sci driver is supposed to
> fall back to PIO.  However, this never really worked due to various
> reasons (sh-sci driver issues and dmaengine framework limitations).

Is it possible to test this under qemu-system-sh4? (Does that emulate the DMA
controller?)

Rob
