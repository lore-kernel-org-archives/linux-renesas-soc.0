Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f172.google.com ([209.85.208.172]:36930 "EHLO
        mail-lj1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726681AbeHTSrB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Aug 2018 14:47:01 -0400
Received: by mail-lj1-f172.google.com with SMTP id v9-v6so11904949ljk.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Aug 2018 08:30:54 -0700 (PDT)
Subject: Re: [PATCH/RFC v2 02/02] ravb: Clean up duplex handling
To: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <153477717610.16950.5787705338176325405.sendpatchset@octo>
 <153477719422.16950.5969632005010865481.sendpatchset@octo>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d6987037-4bba-2027-9783-0aa330fa2d7d@cogentembedded.com>
Date: Mon, 20 Aug 2018 18:30:52 +0300
MIME-Version: 1.0
In-Reply-To: <153477719422.16950.5969632005010865481.sendpatchset@octo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/20/2018 05:59 PM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Since only full-duplex operation is supported by the
> hardware, remove duplex handling code and keep the
> register setting of ECMR.DM fixed at 1.
> 
> This updates the driver implementation to follow the
> data sheet text "This bit should always be set to 1."
> 
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")

  Fixes: tag should precede sign-off.

[...]

   You missed to add this from the previous review:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   The net.git repo is always open, so you can post these patches to netdev
already...

MBR, Sergei
