Return-Path: <SRS0=E4fS=PS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D05FC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 18:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5087E208E3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Jan 2019 18:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="rP7yTP58"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfAJSih (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Jan 2019 13:38:37 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39920 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbfAJSig (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jan 2019 13:38:36 -0500
Received: by mail-lj1-f196.google.com with SMTP id t9-v6so10635713ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Jan 2019 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PncuKPwvlI6FPC80wMYQQVkhtlKb0AQCLtRUD7P8Dzo=;
        b=rP7yTP58li6Df187HVXj/qyfsWHjtLLCzjWLBFRPJjrpbyVu39FhrhtKzs8o1idzlx
         Rc8YZxuGAjvbJKX/hnSDnhFDFk0HKAf7Zlm9dwrYZc8nda3FiTd//ucK8Pl98Z09m586
         7cVyJlDwRhTFjcAAX2rdbYVlwJ3yUmN4mLtS2NNWr9UC+b90674XoOOelkB5QmcR9BWx
         SkIBHOiasnGpHYtt5yEPAVUAnrbN+u76KnxTP1V/g5Mt2gEsoXOUTsPO5ePdbUBVcEDI
         R1lFPncqfOYO3IcmIWAvGPHjOgnLxyszTusDcOPzzfo9S/HZjBFUHiRWwOlmc/1RL8i3
         Gubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=PncuKPwvlI6FPC80wMYQQVkhtlKb0AQCLtRUD7P8Dzo=;
        b=RjHJUr0uPYKthoH0iiVp0O/QmFCTckMY5pkssOHrrTzOPrlih0aDD55C+HZpEjjlkR
         d/2qoKMvO9iApb4T7oSGpCYSKJOw7X/ynZT3ymce5vr3LEKyBnTPknsUqMySu1rs4hms
         7phrclhqla/gWbMnbgQr0+pUdUtPejlVQypO0K4klsdJ0vvNMTvDLBlvuyZicIuGyeXq
         jeBa3i9I0CA64xdmjlCxWhxi6LDCPvK269HK2/GdwYIZFzp9KP9gXHCAMh6Ku/l4CfUL
         +LOtPV2/c2iQDOLXvzE7WkYmSDNS2KZy5B47D1rBtUHzK0DC1JjyJZfS+mSYL0my1FPW
         SomQ==
X-Gm-Message-State: AJcUuke0ChvKFbj9dWJkGpOLJPvkiWIgWTsB4Msf3luBKxywQ45rgNQe
        J2ARfmzb2nSPY0IrRvk8Vn+dS958eP8=
X-Google-Smtp-Source: ALg8bN5rJTG1ooYGsaH6Jh/qYuf+xkIpM33zLtCnlnOIM12agsKVs1qq04JXox/yDc6LZAH232C3lA==
X-Received: by 2002:a2e:917:: with SMTP id 23-v6mr6340747ljj.1.1547145515111;
        Thu, 10 Jan 2019 10:38:35 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.83.92])
        by smtp.gmail.com with ESMTPSA id x16sm13946439lff.26.2019.01.10.10.38.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 10:38:34 -0800 (PST)
Subject: Re: [PATCH RFT] spi-renesas-rpc: manual read issue workaround
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, Mason Yang <masonccyang@mxic.com.tw>,
        linux-renesas-soc@vger.kernel.org
References: <76eb5af5-756e-4d54-0be2-55573649d2d1@cogentembedded.com>
 <20190107181505.GR9570@sirena.org.uk>
 <e56eec35-9628-9c75-4a8d-685ffef5e2b9@cogentembedded.com>
 <20190108122907.GA6590@sirena.org.uk>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <09bc4c3b-cd23-753e-0a26-a74c30ec3cf6@cogentembedded.com>
Date:   Thu, 10 Jan 2019 21:38:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190108122907.GA6590@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/08/2019 03:29 PM, Mark Brown wrote:

>>>>   drivers/spi/spi-renesas-rpc.c |   66 ++++++++++++++++++++++++++----------------
> 
>>> This does not exist upstream.
> 
>>    As I said, the patch was atop of the RPC-IF driver patch by M. Yang.
> 
> Please don't submit patches for things that aren't upstream upstream.

   Even with RFC/RFT in the subject?

MBR, Sergei
