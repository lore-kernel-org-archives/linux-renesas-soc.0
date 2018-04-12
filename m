Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:41965 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbeDLWGO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Apr 2018 18:06:14 -0400
Received: by mail-lf0-f41.google.com with SMTP id o102-v6so9840005lfg.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Apr 2018 15:06:14 -0700 (PDT)
Date: Fri, 13 Apr 2018 00:06:11 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Ingo Molnar <mingo@redhat.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: Potential problem with 31e77c93e432dec7 ("sched/fair: Update
 blocked load when newly idle")
Message-ID: <20180412220611.GI12256@bigcity.dyn.berto.se>
References: <20180412091822.GG12256@bigcity.dyn.berto.se>
 <CAKfTPtAE3qeWcTdT-WL8nrbZmP_+OaxPyyjUfVCzn=rax9tQZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtAE3qeWcTdT-WL8nrbZmP_+OaxPyyjUfVCzn=rax9tQZQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vincent,

On 2018-04-12 12:33:27 +0200, Vincent Guittot wrote:
[snip[

> 
> Can you send me your config ?
> 
> I'm going to prepare a debug patch to spy what's happening when entering idle

I'm sorry i missed this request when first reading your reply, I'm using
arch/arm/configs/shmobile_defconfig for my tests.

-- 
Regards,
Niklas S�derlund
