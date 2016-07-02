Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
Reply-To: chanwoo@kernel.org
In-Reply-To: <1467366121-14120-2-git-send-email-peter.chen@nxp.com>
References: <1467366121-14120-1-git-send-email-peter.chen@nxp.com> <1467366121-14120-2-git-send-email-peter.chen@nxp.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Sat, 2 Jul 2016 13:46:20 +0900
Message-ID: <CAGTfZH0vSSNSJQHaNFjzd_ciPAcRG8bST-W5bacA2mi4T7sQTg@mail.gmail.com>
Subject: Re: [PATCH 1/7] extcon: add missing of_node_put after calling of_parse_phandle
To: Peter Chen <peter.chen@nxp.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Peter,

Applied it.

Regards,
Chanwoo Choi

2016-07-01 18:41 GMT+09:00 Peter Chen <peter.chen@nxp.com>:
> of_node_put needs to be called when the device node which is got
> from of_parse_phandle has finished using.
>
> Cc: MyungJoo Ham <myungjoo.ham@samsung.com>
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>
> ---
>  drivers/extcon/extcon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/extcon/extcon.c b/drivers/extcon/extcon.c
> index 21a123c..86ea14d 100644
> --- a/drivers/extcon/extcon.c
> +++ b/drivers/extcon/extcon.c
> @@ -1107,10 +1107,12 @@ struct extcon_dev *extcon_get_edev_by_phandle(struct device *dev, int index)
>         list_for_each_entry(edev, &extcon_dev_list, entry) {
>                 if (edev->dev.parent && edev->dev.parent->of_node == node) {
>                         mutex_unlock(&extcon_dev_list_lock);
> +                       of_node_put(node);
>                         return edev;
>                 }
>         }
>         mutex_unlock(&extcon_dev_list_lock);
> +       of_node_put(node);
>
>         return ERR_PTR(-EPROBE_DEFER);
>  }
> --
> 1.9.1
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
