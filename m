Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34567 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754820AbcKDLnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2016 07:43:21 -0400
Received: by mail-lf0-f43.google.com with SMTP id b81so61577602lfe.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Nov 2016 04:43:20 -0700 (PDT)
Subject: Re: [PATCH v2] ARM: DTS: r8a7794: alt: Fix PFC names for DU
To: Jacopo Mondi <jacopo@jmondi.org>, horms@verge.net.au,
        magnus.damm@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux@armlinux.org.uk
References: <1478180574-15464-1-git-send-email-jacopo@jmondi.org>
 <1478201686-25488-1-git-send-email-jacopo@jmondi.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c0a3c44b-545c-7af3-feed-857cb20ef698@cogentembedded.com>
Date: Fri, 4 Nov 2016 14:43:18 +0300
MIME-Version: 1.0
In-Reply-To: <1478201686-25488-1-git-send-email-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 11/3/2016 10:34 PM, Jacopo Mondi wrote:

> Update the PFC pin groups and function names of DU interface for
> r8a7794 ALT board.
>
> The currently specified pin groups and function names prevented PFC and
> DU interfaces from being correctly configured:
>
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> sh-pfc e6060000.pin-controller: function 'du' not supported
> sh-pfc e6060000.pin-controller: invalid function du in map table
> rcar-du: probe of feb00000.display failed with error -22
>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
