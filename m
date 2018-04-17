Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:44062 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754879AbeDQQGA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Apr 2018 12:06:00 -0400
Received: by mail-lf0-f48.google.com with SMTP id g203-v6so28128222lfg.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Apr 2018 09:05:59 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next 2/5] ravb: correct ptp does failure after
 suspend and resume
To: Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-3-horms+renesas@verge.net.au>
 <20180417100532.tfjgm4hewmi42al4@ninjato>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b1b9ba17-8e7d-df49-5e83-ea3f2d84570a@cogentembedded.com>
Date: Tue, 17 Apr 2018 19:05:56 +0300
MIME-Version: 1.0
In-Reply-To: <20180417100532.tfjgm4hewmi42al4@ninjato>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/17/2018 01:05 PM, Wolfram Sang wrote:

>> @@ -2302,6 +2305,7 @@ static int __maybe_unused ravb_resume(struct device *dev)
>>  {
>>  	struct net_device *ndev = dev_get_drvdata(dev);
>>  	struct ravb_private *priv = netdev_priv(ndev);
>> +	struct platform_device *pdev = priv->pdev;

   Could infer 'pdev' from 'dev' (avoiding the dereference)...

> Minor nit: I'd save this line...
> 
>> +	if (priv->chip_id != RCAR_GEN2)
>> +		ravb_ptp_init(ndev, pdev);
> 
> ... and use ravb_ptp_init(ndev, priv->pdev); here.

   Agreed, no dire need for the new variable used only once.

MBR, Sergei
