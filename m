Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:39050 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751271AbeCaV2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Mar 2018 17:28:23 -0400
Received: by mail-lf0-f66.google.com with SMTP id p142-v6so16362816lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 31 Mar 2018 14:28:23 -0700 (PDT)
Subject: Re: [PATCH net-next 1/2] sh_eth: add sh_eth_cpu_data::no_xdfar flag
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
References: <998029b4-9400-ebc3-51c1-623c3f72b6cc@cogentembedded.com>
 <233e32d1-947b-2377-3d1f-39d5d83bd3f7@cogentembedded.com>
Message-ID: <f2d1b237-fa73-0aab-ef2e-e7cccdfa89f7@cogentembedded.com>
Date: Sun, 1 Apr 2018 00:28:20 +0300
MIME-Version: 1.0
In-Reply-To: <233e32d1-947b-2377-3d1f-39d5d83bd3f7@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/01/2018 12:22 AM, Sergei Shtylyov wrote:

> The commit 6ded286555c2 ("sh_eth: Fix RX recovery on R-Car in case of RX
> ring underrun") added a check for an bad RDFAR offset in sh_eth_rx(), so
> that the code could work on the R-Car Ether controllers which don't have
> this register (and TDFAR), then the commit 3365711df02 ("sh_eth: WARN on

   Oops, only 11 digits! Should have been 3365711df024. :-)

> access to a register not implemented in a particular chip") replaced
> offset 0 with 0xffff. Adding/checking the 'no_xdfar' bit field in the
> 'struct sh_eth_cpu_data' instead results in less object code...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
