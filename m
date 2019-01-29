Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DACC169C4
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 11:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 83C252084C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 11:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="kkuSVDfP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfA2LGq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 06:06:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45600 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726270AbfA2LGq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 06:06:46 -0500
Received: by mail-lj1-f196.google.com with SMTP id s5-v6so17049806ljd.12
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Jan 2019 03:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4N4NsSBz0Zl4gh8w1hcFXLP9GpnYhWMALGLAWMtHchY=;
        b=kkuSVDfPgbXUX0MerS7A2tk/ZjS0kAYFM+Tp9CFRCWEeX8i+++T4UMdj3Jzg/sEjHC
         0echa2CFo03y56/2Oqo6niqLSHYCKbLU5hbSpoGpxC1t3i27iuss5I/ww9amfNZSYMuI
         TLhWX4g3+7mztfC3ie1N5U3/fD87h7+KvHaAia2fgKskTMbj5DzE6x13gluueTgvOBH2
         JM3Dif3DCAm7e5CB96mL8+7cGBauEZ8Ueh0JWZhmmQ0uACEC9+rKUAJRDE6n1jLyq6G8
         Aq9zFWseWbg4Yicitp4XejPPzPgPHRwKHt7xDxjBlYJNPoTTKwkAMJA1O00rjtnSR3xd
         g2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=4N4NsSBz0Zl4gh8w1hcFXLP9GpnYhWMALGLAWMtHchY=;
        b=Pn1sqQCSMe3QTE5j+shVyj9TT471gEH2eVqpd8aaaD9vn579b5zrcD3y+Xnd63PfLY
         x1f3E56K9X1FmwgxG+yNqQ6MpgsQcdxzyAa24vivV4BYhxGjHGgRFuPbD8Jixoduec9w
         4slqPbfSfbY+hIODEiNzYFPVvpE2QJr7oFxxa2GBk2GhbxLdVIUzm+z6/XCg9HO0180E
         G8j6/FQIzXJTOT3hE76O+Yzcj04bop9IkapsWkkd4R+uMSU6kf6drbd9eg10/gdisAfy
         kqB6cTia3ed4TWqF4dT7vwxvHzBT7NryADFjF7ZNu2Pn5cP7OQyYqDj5bvsz8NGb01Zz
         rx1A==
X-Gm-Message-State: AJcUukfBBqX3D4+RO4hGfHdZLi/LlysCZhBqVxKx3YYQsqSVvX6RwZfk
        Uzn+qlt6thsRvDaDwIJHDSvD/sMD5EQ=
X-Google-Smtp-Source: ALg8bN58P24tW9Ad9evvIWbRpdK05xFg7oU25nzWCcRA4VMvrKHaKBJeQb5sv6jioVSjhM0Fvk/T3Q==
X-Received: by 2002:a2e:681a:: with SMTP id c26-v6mr20258349lja.175.1548760004214;
        Tue, 29 Jan 2019 03:06:44 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.176])
        by smtp.gmail.com with ESMTPSA id y24sm3422906lfj.17.2019.01.29.03.06.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jan 2019 03:06:43 -0800 (PST)
Subject: Re: [PATCH 0/7] sh_eth: implement simple RX checksum offload
To:     Heiner Kallweit <hkallweit1@gmail.com>, netdev@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <62dbdf72-4e3f-6c3e-901f-5e8f6de8dec3@gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <9673a5f3-13d5-8c97-d544-edec921cddab@cogentembedded.com>
Date:   Tue, 29 Jan 2019 14:06:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <62dbdf72-4e3f-6c3e-901f-5e8f6de8dec3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/27/2019 08:52 PM, Heiner Kallweit wrote:

>> Here's a set of 7 patches against DaveM's 'net-next.git' repo. I'm implemeting
>> the simple RX checksum offload (like was done for the 'ravb' driver by Simon
>> Horman); it was only tested on the R8A77980 SoC, the other SoCs should just
>> work (according to their manuals)...
>>
>> [1/7] sh_eth: rename sh_eth_cpu_data::hw_checksum
>> [2/7] sh_eth: RX checksum offload support
>> [3/7] sh_eth: offload RX checksum on R7S72100
>> [4/7] sh_eth: offload RX checksum on R8A7740
>> [5/7] sh_eth: offload RX checksum on R8A77980
>> [6/7] sh_eth: offload RX checksum on SH7734
>> [7/7] sh_eth: offload RX checksum on SH7763
>>
>> MBR, Sergei
>>
> Hi Sergei,
> 
> the formatting of the patch series isn't in line with the netdev standards.
> See here: https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html
> 
> - cover letter isn't generated by git

   Sorry, I don't use git for development. However, I fail to see where this
is requested in the above FAQ.

>  
> - That's not ok
> --- *net-next.orig/*drivers/net/ethernet/renesas/sh_eth.h
> +++ *net-next/*drivers/net/ethernet/renesas/sh_eth.h
> 
> - patches miss net / net-next annotation

   I noted the applicable repo in the cover letter. I know I should use
the subject... but I just keep forgetting about this requirement. :-)
 
> Heiner

MBR, Sergei
