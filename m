Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFF5C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 20:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 035E921871
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 20:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfACUuC (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 15:50:02 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:38832 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbfACUuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 15:50:02 -0500
Received: by mail-ed1-f67.google.com with SMTP id h50so30124079ede.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Jan 2019 12:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rI9uISVGVVHqNmyfmz3DgDa0kUGfsZ+ichOdFy8rec0=;
        b=BzEYD8yq/kMVUHHe9P84rpf8flby6gp/bQlJt/YhVUfXDScLUuGBFG2jlGkPagHD7D
         pKFvuW5S7v9z4RagMz1nrMO5JvTLhqI/fnTvqpOH60FCI97y9+kPenGkIy3HIomNsQVi
         NEN3rNIooexuRXFixv/KcpYmuUKbNa48UZy3u72Db+Uz8cS9FG2LCVUBEvNqQgaf8YLY
         hTrk/yNb1wbcdu2Dj+Lgb2aDldxHQdWx7Tmz6cA1BEmLfcuvtX0PshcUFFI2/KiCpSi6
         x4YisHx4bQCXzmb9F0eQzjRgJR+To9ofGXO0fswlcuyY8ql8CFh0DNcp0liXS6XS5oy/
         NYJQ==
X-Gm-Message-State: AA+aEWbvXdul40IUMO7FcU/bHjo2N0gyzBxL/wJ3rR7+mxPuEIxex8AL
        /jt+JZnLccChcGj6q3vXC4y9Rg==
X-Google-Smtp-Source: AFSGD/WLYV03334aMKjzD7t9W9iWS3grz3VXwHEFKHunHr0pqloTc+lHS519wpqVDfsOV1psuTSsdQ==
X-Received: by 2002:a50:9dc1:: with SMTP id l1mr44096499edk.272.1546548600182;
        Thu, 03 Jan 2019 12:50:00 -0800 (PST)
Received: from shalem.localdomain (546A5441.cm-12-3b.dynamic.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id f20sm23506313edf.19.2019.01.03.12.49.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jan 2019 12:49:59 -0800 (PST)
Subject: Re: [PATCH v2 2/9] i2c: reject new transfers when adapters are
 suspended
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20181222202623.4521-1-wsa+renesas@sang-engineering.com>
 <20181222202623.4521-3-wsa+renesas@sang-engineering.com>
 <5e560c2e-4da9-05ef-9bfa-3391fdd8ad23@redhat.com>
 <20190103185917.zfcw24n5w4n4qu2q@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <03b8e4ab-412e-24cf-9c79-5939896b3008@redhat.com>
Date:   Thu, 3 Jan 2019 21:49:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20190103185917.zfcw24n5w4n4qu2q@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 03-01-19 19:59, Wolfram Sang wrote:
> 
>> I share your desire to have the check for this shared in core code,
>> but I'm afraid that just is not going to work.
> 
> Okay, so this series is definately not it. Probably the previous one
> which exposes helpers is not a bad idea after all. Because it is
> ulitmately the driver's decision when to use the helpers...

Agreed.

Regards,

Hans

