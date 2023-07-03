Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2371EB64D9
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  3 Jul 2023 02:13:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjGCCNK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 2 Jul 2023 22:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjGCCNJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 2 Jul 2023 22:13:09 -0400
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C607188;
        Sun,  2 Jul 2023 19:13:07 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R711e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045192;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VmQ0CKk_1688350382;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0VmQ0CKk_1688350382)
          by smtp.aliyun-inc.com;
          Mon, 03 Jul 2023 10:13:03 +0800
Message-ID: <1688350297.9197447-5-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio-mmio: don't break lifecycle of vm_dev
Date:   Mon, 3 Jul 2023 10:11:37 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        weiping zhang <zhangweiping@didichuxing.com>,
        Cornelia Huck <cohuck@redhat.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20230629120526.7184-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230629120526.7184-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 29 Jun 2023 14:05:26 +0200, Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:
> vm_dev has a separate lifecycle because it has a 'struct device'
> embedded. Thus, having a release callback for it is correct.
>
> Allocating the vm_dev struct with devres totally breaks this protection,

device? or driver?

And why?


> though. Instead of waiting for the vm_dev release callback, the memory
> is freed when the platform_device is removed. Resulting in a
> use-after-free when finally the callback is to be called.

Can we have the break stack?

Thanks.


>
> To easily see the problem, compile the kernel with
> CONFIG_DEBUG_KOBJECT_RELEASE and unbind with sysfs.
>
> The fix is easy, don't use devres in this case.
>
> Found during my research about object lifetime problems.
>
> Fixes: 7eb781b1bbb7 ("virtio_mmio: add cleanup for virtio_mmio_probe")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/virtio/virtio_mmio.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
> index a46a4a29e929..97760f611295 100644
> --- a/drivers/virtio/virtio_mmio.c
> +++ b/drivers/virtio/virtio_mmio.c
> @@ -607,9 +607,8 @@ static void virtio_mmio_release_dev(struct device *_d)
>  	struct virtio_device *vdev =
>  			container_of(_d, struct virtio_device, dev);
>  	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
> -	struct platform_device *pdev = vm_dev->pdev;
>
> -	devm_kfree(&pdev->dev, vm_dev);
> +	kfree(vm_dev);
>  }
>
>  /* Platform device */
> @@ -620,7 +619,7 @@ static int virtio_mmio_probe(struct platform_device *pdev)
>  	unsigned long magic;
>  	int rc;
>
> -	vm_dev = devm_kzalloc(&pdev->dev, sizeof(*vm_dev), GFP_KERNEL);
> +	vm_dev = kzalloc(sizeof(*vm_dev), GFP_KERNEL);
>  	if (!vm_dev)
>  		return -ENOMEM;
>
> --
> 2.35.1
>
