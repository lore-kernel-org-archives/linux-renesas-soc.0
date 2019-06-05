Return-Path: <SRS0=QxYK=UE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564B1C28CC5
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  5 Jun 2019 17:27:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 23B6F20866
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  5 Jun 2019 17:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="JBhhYcbz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbfFER1E (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 5 Jun 2019 13:27:04 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39461 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726604AbfFER1E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 13:27:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id v18so2761583ljh.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Jun 2019 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uPR5ZsfuFUf9C+Xfxa0HBx/qqmGHuh9ku3HhTnzm9SE=;
        b=JBhhYcbz3yRLzCbu5Yx9QYNdhM5zCDK+k75RCW/Lsgy6Essr24xS7r0J0CEiNKkkPL
         sA3bueboQ2lIeIzoMvQCylo9mo9b8fphwMoGvE/v2ev1Ek6fT0IHGvjFccn3/ACOQcjJ
         IJGd1mVTZ2BUj9kNUpvWwO+VlUP60DQlrVZy0Wp3VqeR4QeOUhS11GwuUUqJPZN0I0qW
         KdryzK+LC44q71QMqA6eKfKjT0fojptEJRQS341XiVUms9iD8vSpjwD8CHV2ZWhLQZwu
         cMA48LMNOJNvqCMYkWbUf2oEUUdpbyLwuXFA7aTvYDBm7d2CwqOSjsJ7jgw5iPxjIrSm
         fl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=uPR5ZsfuFUf9C+Xfxa0HBx/qqmGHuh9ku3HhTnzm9SE=;
        b=kThNMhhArl0ldsG7UlhgvoPwginJO38622m5akYgnbGNlJkKZIvqIoaiRUF5yZG8Ub
         m+I+bXP5JrvS9ukhXBXLeVPUNBDbZZjnAUP/lxVHryaKXiF/dzhR+jUxN5LYbOsp8cSG
         kd98xZUu841Kfunxfvqr1v+xqP3Q4z+2oJFcxKf+QKzxs6HevUkxv17eEhvpeNqpeADF
         8yNT80EGamq2gsTbAHfzvd61os/6aoB6wA7iH1lYGLZcVenqCw6t0YUdgisZEaVtSqP+
         7Pst4BTX0H2a63x9JtE8QGjvBked2yXVJmKNLjJ9Tl3NLDnuvkRj1QAGTeoXeZ/aJhds
         RPSg==
X-Gm-Message-State: APjAAAW9uQLH0nT6SAVbpWn0oKqnZh01NDnS7lhkUpxg5Q1PB/t3KcAH
        G06sggqfp5zEIgQe8t6dRYrxgDR4W7k=
X-Google-Smtp-Source: APXvYqzi33O8O+NqvuKNhyi36qg2WWf4gwQroIUxY2/SjrPHN3kXuBdIP9OeLaaBFLx1cAu9uPwHrg==
X-Received: by 2002:a2e:8116:: with SMTP id d22mr9941237ljg.8.1559755622358;
        Wed, 05 Jun 2019 10:27:02 -0700 (PDT)
Received: from wasted.cogentembedded.com ([31.173.84.82])
        by smtp.gmail.com with ESMTPSA id z26sm1501850ljz.64.2019.06.05.10.27.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 10:27:01 -0700 (PDT)
Subject: Re: [PATCH v2] ravb: implement MTU change while device is up
To:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org
Cc:     netdev@vger.kernel.org, davem@davemloft.net,
        niklas.soderlund@ragnatech.se, wsa@the-dreams.de,
        horms@verge.net.au, magnus.damm@gmail.com
References: <1559747660-17875-1-git-send-email-uli+renesas@fpond.eu>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <dab9e22e-446f-b08a-86df-4ffa22a107c1@cogentembedded.com>
Date:   Wed, 5 Jun 2019 20:27:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1559747660-17875-1-git-send-email-uli+renesas@fpond.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 06/05/2019 06:14 PM, Ulrich Hecht wrote:

> Uses the same method as various other drivers: shut the device down,
> change the MTU, then bring it back up again.
> 
> Tested on Renesas D3 Draak board.
> 
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
