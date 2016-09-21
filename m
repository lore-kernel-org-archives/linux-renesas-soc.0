Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [RFC PATCH 2/3] PM / Domains: Add support for devices with
 multiple domains
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1474367287-10402-1-git-send-email-jonathanh@nvidia.com>
 <1474367287-10402-3-git-send-email-jonathanh@nvidia.com>
 <CAMuHMdVc+EjkbcpPKyzbCfDjp65gF3xP3bhkjh6SKLt6KDTtXg@mail.gmail.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <658004af-e4f4-8b0c-cdc1-43661d331d70@nvidia.com>
Date: Wed, 21 Sep 2016 15:37:14 +0100
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVc+EjkbcpPKyzbCfDjp65gF3xP3bhkjh6SKLt6KDTtXg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 21/09/16 09:53, Geert Uytterhoeven wrote:
> Hi Jon,
> 
> On Tue, Sep 20, 2016 at 12:28 PM, Jon Hunter <jonathanh@nvidia.com> wrote:
>> Some devices may require more than one PM domain to operate and this is
>> not currently by the PM domain framework. Furthermore, the current Linux
>> 'device' structure only allows devices to be associated with a single PM
>> domain and so cannot easily be associated with more than one. To allow
>> devices to be associated with more than one PM domain, if multiple
>> domains are defined for a given device (eg. via device-tree), then:
>> 1. Create a new PM domain for this device. The name of the new PM domain
>>    created matches the device name for which it was created for.
>> 2. Register the new PM domain as a sub-domain for all PM domains
>>    required by the device.
>> 3. Attach the device to the new PM domain.
> 
> This looks a suboptimal to me: if you have n devices sharing the same PM
> domains, you would add n new subdomains?

BTW, would this be the case today for some renesas devices or are you
just pointing this out as something that could be optimised/improved?

Cheers
Jon

-- 
nvpublic
