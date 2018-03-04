Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:43674 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751819AbeCDH7V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Mar 2018 02:59:21 -0500
Received: by mail-lf0-f46.google.com with SMTP id q69so18844047lfi.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 03 Mar 2018 23:59:20 -0800 (PST)
Subject: Re: [PATCH] ravb: remove erroneous comment
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20180303223954.14152-1-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <7f564c35-c12e-f51b-e5b4-f793c540d50c@cogentembedded.com>
Date: Sun, 4 Mar 2018 10:59:20 +0300
MIME-Version: 1.0
In-Reply-To: <20180303223954.14152-1-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 3/4/2018 1:39 AM, Niklas Söderlund wrote:

> When addressing a review comment in a early version of the offending
> patch a comment where left in which should have been removed. Remove the

    s/where/was/?

> comment to keep it consistent with the code.
> 
> Fixes: 75efa06f457bbed3 ("ravb: add support for changing MTU")
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
