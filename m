Return-Path: <SRS0=P06h=RT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D89CC43381
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 16:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F0D3E2186A
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 16 Mar 2019 16:43:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbfCPQnM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 16 Mar 2019 12:43:12 -0400
Received: from sauhun.de ([88.99.104.3]:46586 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfCPQnM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 16 Mar 2019 12:43:12 -0400
Received: from localhost (ip-109-41-128-104.web.vodafone.de [109.41.128.104])
        by pokefinder.org (Postfix) with ESMTPSA id E6B333E42EE;
        Sat, 16 Mar 2019 17:43:08 +0100 (CET)
Date:   Sat, 16 Mar 2019 17:43:08 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Kieran Bingham <kieran@ksquared.org.uk>
Subject: Re: [PATCH v7 2/3] i2c: core: add device-managed version of
 i2c_new_dummy
Message-ID: <20190316164308.GA1747@kunai>
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <20190313165526.28588-3-wsa+renesas@sang-engineering.com>
 <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3fd63fb-0eec-78f3-992f-84194bf571dd@axentia.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> I personally really dislike the proposed name. It is akin to the abomination
> where some sort of abbreviation of the types of variables are included also
> in the variable names. It's useless clutter, at least to me.

In general, I agree with you...

> I can see that you do not want to change the i2c_new_{device,dummy} names
> since they are kind of widespread and I can also see that you want to
> match the devm_ name with the non-devm_ name. So, I see *why* this naming
> is as it is, but I just don't like it.

... yet, there is another reason which is consistency. i2c_new_{device,dummy}
return NULL if something went wrong, and if the devm_* variants return
an ERRPTR, this is super confusing and error prone IMO. And the
difference between 'i2c_new_dummy' and 'i2c_register_dummy' doesn't make
that more clear, I think.

I would love to convert all of those functions to return an errptr at
some time. However, they are so widespread that this is difficult. I
actually had a look to convert the users with coccinelle, but handling
the error cases is so diverse that I don't think this is a way forward.

> I had a look at a couple of the i2c_new_dummy call sites, and some of them
> can be easily updated to simply pass on the PTRERR instead of hardcoding
> INVAL (or something) on NULL, some of them ignore the return value (and are
> thus not able to call i2c_unregister_device correctly) and some are

Those are likely prime candidates to convert to devm_*.

> different in other ways. In short, it seems that there are plenty of good
> opportunities to update lots of call sites to the new interfaces.

Yes. But it is quite some work, even more with i2c_new_device.

> However, after most of the maintained uses have been updated we are bound
> to have a tail of unmaintained code that will use the old interface. At
> some point, someone might convert the tail of call sites using the old
> NULL-returning functions. At that point we are stuck with a bunch of ugly
> hysterical foo_errptr names. And again it will be a daunting series to
> change them all at once.

OK, I can see that. If the longterm goal is to return errnos, then
it doesn't make sense to have it in the function name. This is valid
criticism. Yet, I still keep the other criticism from the first
paragraph where i2c_new_dummy and i2c_register_dummy is confusing.
Unless someone comes up with a solution we all overlooked, it will
probably be chosing the lesser evil.


