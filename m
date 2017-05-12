Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:36131 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756371AbdELKgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 May 2017 06:36:51 -0400
MIME-Version: 1.0
In-Reply-To: <4398514.qBghdda7X5@avalon>
References: <1493303863-23719-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20170512091636.GG27979@verge.net.au> <4398514.qBghdda7X5@avalon>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Fri, 12 May 2017 12:36:50 +0200
Message-ID: <CAO3366w2JtF9Ni6_yzuQs7-dEy=LNFSekOyiA9YJbHHvvpPLzQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] r8a7795/6 Salvator-X PWM enablement
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>, geert@glider.be,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 12, 2017 at 12:00 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> * arm64: dts: r8a7795-salvator-x: Enable PWM2
>
> I've asked Ulrich for a clarification on this patch as I'm not sure it's
> needed, but he hasn't answered yet. Could we delay merging it until the
> situation is clarified ?

Enabling it allows to control the switching frequency from userspace
via sysfs. I guess it's a matter of taste whether to do this by
default, but I see no downside to it.

CU
Uli
